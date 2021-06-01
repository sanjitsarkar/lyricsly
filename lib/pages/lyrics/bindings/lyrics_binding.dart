import 'package:get/get.dart';
import 'package:lyricsly/pages/lyrics/data/lyrics_api_provider.dart';
import 'package:lyricsly/pages/lyrics/data/lyrics_repository.dart';
import 'package:lyricsly/pages/lyrics/domain/adapters/repository_adapter.dart';
import 'package:lyricsly/pages/lyrics/presentation/controllers/lyrics_controller.dart';

class LyricsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILyricsProvider>(() => LyricsProvider());
    Get.lazyPut<ILyricsRepository>(
        () => LyricsRepository(provider: Get.find()));
    Get.lazyPut(() => LyricsController(lyricsRepository: Get.find()));
  }
}
