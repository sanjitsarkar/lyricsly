import 'package:get/get.dart';
import 'package:lyricsly/pages/lyrics/bindings/lyrics_binding.dart';
import 'package:lyricsly/pages/lyrics/presentation/views/artist_details_view.dart';
import 'package:lyricsly/pages/lyrics/presentation/views/lyrics_details_view.dart';
import 'package:lyricsly/pages/lyrics/presentation/views/lyrics_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LYRICS;

  static final routes = [
    GetPage(
        name: Routes.LYRICS,
        page: () => LyricsView(),
        binding: LyricsBinding(),
        children: [
          GetPage(name: Routes.LYRICS_DEATILS, page: () => LyricsDetailsView()),
          GetPage(name: Routes.ARTIST_DETAILS, page: () => ArtistDetailsView()),
        ]),
  ];
}
