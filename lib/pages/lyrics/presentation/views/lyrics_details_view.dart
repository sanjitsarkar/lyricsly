import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyricsly/pages/lyrics/domain/entity/song_info_model.dart';
import 'package:lyricsly/pages/lyrics/presentation/controllers/lyrics_controller.dart';
import 'package:lyricsly/shared/colors.dart';
import 'package:lyricsly/shared/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LyricsDetailsView extends GetWidget<LyricsController> {
  const LyricsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final songInfo = Get.arguments as SongInfo;

    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(songInfo.songTitle,
              style: TextStyle(
                  // color: colorConvert(songInfo.songArtPrimaryColor),
                  color: Colors.black)),
        ),
        body: Obx(() => Stack(
              children: [
                WebView(
                  initialUrl: songInfo.lyricsUrl,
                  onProgress: (progress) {
                    controller.progress.value = progress;
                  },
                ),
                if (controller.progress.value != 100)
                  Center(
                      child: ClipOval(child: Image.asset("assets/loader.gif"))),
              ],
            )));
  }
}
