import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_example/pages/lyrics/domain/entity/song_info_model.dart';
import 'package:get_example/shared/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LyricsDetailsView extends StatelessWidget {
  const LyricsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final songInfo = Get.arguments as SongInfo;

    return Scaffold(
        extendBody: true,
        appBar: AppBar(),
        body: WebView(
          initialUrl: songInfo.lyricsUrl,
        ));
  }
}
