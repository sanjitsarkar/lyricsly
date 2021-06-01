import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_example/pages/lyrics/domain/entity/song_info_model.dart';
import 'package:get_example/pages/lyrics/presentation/controllers/lyrics_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArtistDetailsView extends GetWidget<LyricsController> {
  const ArtistDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> info = Get.arguments;

    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(info[0],
              style: TextStyle(
                  // color: colorConvert(songInfo.songArtPrimaryColor),
                  color: Colors.black)),
        ),
        body: Obx(() => Stack(
              children: [
                WebView(
                  initialUrl: info[1],
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
