import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyricsly/pages/lyrics/domain/entity/song_info_model.dart';

import '../../domain/adapters/repository_adapter.dart';

class LyricsController extends SuperController<List<SongInfo>> {
  LyricsController({required this.lyricsRepository});

  final ILyricsRepository lyricsRepository;
  RxList<SongInfo> songInfos = RxList.empty();
  RxBool loading = RxBool(false);
  RxInt progress = RxInt(0);
  Rx<String> label = "Search any Song".obs;
  Rx<TextEditingController> search = TextEditingController().obs;
  @override
  void onInit() {
    super.onInit();
    // append(() => lyricsRepository.getSongInfo("search").obs);
    // searchSong("love");
    // print(songInfos.toString());
  }

  Future searchSong(String search) async {
    songInfos.clear();
    songInfos.value = await lyricsRepository.getSongInfo(search);
  }

  @override
  void onReady() {
    // print('The build method is done. '
    // 'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    // print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    // print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    // print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    // print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    // print('onDetached called');
  }

  @override
  void onInactive() {
    // print('onInative called');
  }

  @override
  void onPaused() {
    // print('onPaused called');
  }

  @override
  void onResumed() {
    // print('onResumed called');
  }
}
