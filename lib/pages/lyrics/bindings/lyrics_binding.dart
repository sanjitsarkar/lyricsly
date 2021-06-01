

import 'package:get/get.dart';
import 'package:get_example/pages/lyrics/data/lyrics_api_provider.dart';
import 'package:get_example/pages/lyrics/data/lyrics_repository.dart';
import 'package:get_example/pages/lyrics/domain/adapters/repository_adapter.dart';
import 'package:get_example/pages/lyrics/presentation/controllers/lyrics_controller.dart';

class LyricsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILyricsProvider>(() => LyricsProvider());
    Get.lazyPut<ILyricsRepository>(
        () => LyricsRepository(provider: Get.find()));
    Get.lazyPut(() => LyricsController(lyricsRepository: Get.find()));
  }
}
