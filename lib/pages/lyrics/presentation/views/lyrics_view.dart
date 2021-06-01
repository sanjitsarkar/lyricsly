import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_example/pages/lyrics/domain/entity/song_info_model.dart';
import 'package:get_example/pages/lyrics/presentation/controllers/lyrics_controller.dart';
import 'package:get_example/routes/app_pages.dart';
import 'package:get_example/shared/colors.dart';
import 'package:get_example/shared/constants.dart';

class LyricsView extends GetWidget<LyricsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        extendBody: true,
        appBar: appBar(),
        body: LyricsBody(controller: controller));
  }

  AppBar appBar() {
    return AppBar(
      title: SearchBar(controller: controller),
      toolbarHeight: 70,
      leadingWidth: 50,
    );
  }
}

// -1 2 3 -4 5
class LyricsBody extends StatelessWidget {
  const LyricsBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LyricsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(() {
      if (controller.songInfos.length == 0 && controller.loading.value == false)
        return labelText();
      else if (controller.loading.value)
        return circularProgress();
      else
        return ListView.builder(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          itemCount: controller.songInfos.length,
          itemBuilder: (BuildContext context, int i) {
            SongInfo songInfo = controller.songInfos[i];
            return SongInfoCard(songInfo: songInfo);
          },
        );
    }));
  }

  Center circularProgress() {
    return Center(
      child: Image.asset("assets/loader.gif"),
    );
  }

  Center labelText() {
    return Center(
      child: Text(
        controller.label.value,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LyricsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          decoration: InputDecoration(
              hintText: "Search Songs Info...",
              suffixIcon:
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              border: InputBorder.none,
              fillColor: Colors.black12,
              filled: true),
          controller: controller.search.value,
          onSubmitted: (value) async {
            controller.loading.value = true;
            await controller.searchSong(controller.search.value.text);
            controller.loading.value = false;

            controller.label.value = "Not found";
          },
        ));
  }
}

class SongInfoCard extends StatelessWidget {
  const SongInfoCard({
    Key? key,
    required this.songInfo,
  }) : super(key: key);

  final SongInfo songInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Container(
        height: h(context) * 0.30,
        width: w(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(songInfo.songArtUrl),
                colorFilter: ColorFilter.mode(
                    colorConvert(songInfo.songArtSecondaryColor),
                    BlendMode.multiply),
                fit: BoxFit.cover,
                scale: 2),
            // backgroundBlendMode: BlendMode.overlay,
            color: colorConvert(songInfo.songArtSecondaryColor)),
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topSection(context),
              bottomSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded bottomSection(BuildContext context) {
    return Expanded(
      child: Container(
        width: w(context),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            roundedArtistImage(),
            SizedBox(
              width: 5,
            ),
            artistName(),
            SizedBox(
              width: 10,
            ),
            if (songInfo.artist.isVerified)
              customIcon(
                  color: Colors.blueAccent,
                  iconData: Icons.verified,
                  tooltip: "Verified"),
            if (songInfo.artist.isMemeVerified)
              customIcon(
                  color: Colors.redAccent,
                  iconData: Icons.emoji_emotions,
                  tooltip: "Meme Verified"),
            if (songInfo.stats!.isHot)
              customIcon(
                  color: Colors.amber.shade900,
                  iconData: Icons.local_fire_department_sharp,
                  tooltip: "Hot"),
            viewsSection()
          ],
        ),
      ),
    );
  }

  Row customIcon(
      {required String tooltip,
      required IconData iconData,
      required Color color}) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          tooltip: tooltip,
          icon: Icon(iconData),
          onPressed: () {},
          color: color,
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  Row viewsSection() {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          tooltip: "Views",
          icon: Icon(Icons.remove_red_eye),
          onPressed: () {},
          color: Colors.blueAccent,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          songInfo.stats!.pageViews.toString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black87.withOpacity(.6),
              fontWeight: FontWeight.w500,
              fontSize: 15),
        )
      ],
    );
  }

  Flexible artistName() {
    return Flexible(
      child: InkWell(
        onTap: () {
          Get.toNamed("/lyrics" + Routes.ARTIST_DETAILS);
        },
        child: Text(
          songInfo.artist.artistName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black87.withOpacity(.6),
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
    );
  }

  InkWell roundedArtistImage() {
    return InkWell(
      onTap: () {
        Get.toNamed("/lyrics" + Routes.ARTIST_DETAILS);
      },
      child: Container(
        padding: EdgeInsets.all(3),
        height: 45,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(.3))
            ],
            color: colorConvert(songInfo.songArtPrimaryColor),
            shape: BoxShape.circle),
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: "assets/loader.gif",
            image: songInfo.artist.artistImage,
            fit: BoxFit.cover,
            height: 42,
            width: 42,
          ),
        ),
      ),
    );
  }

  Expanded topSection(BuildContext context) {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: () {
          Get.toNamed("/lyrics" + Routes.LYRICS_DEATILS, arguments: songInfo);
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              roundedSongImage(context),
              SizedBox(
                width: 20,
              ),
              songTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded songTitle() {
    // print(songInfo.songArtTextColor);
    return Expanded(
      child: Text(
        songInfo.songTitle,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
  }

  Container roundedSongImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      width: w(context) * .3,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.3))
          ],
          shape: BoxShape.circle,
          color: colorConvert(songInfo.songArtPrimaryColor)),
      child: ClipOval(
        child: FadeInImage.assetNetwork(
          placeholder: "assets/loader.gif",
          image: songInfo.songArtUrl,
          width: w(context) * .3 - 7,
          height: w(context) * .3 - 7,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
