import 'package:get/get.dart';
import 'package:get_example/pages/lyrics/bindings/lyrics_binding.dart';
import 'package:get_example/pages/lyrics/presentation/views/artist_details_view.dart';
import 'package:get_example/pages/lyrics/presentation/views/lyrics_details_view.dart';
import 'package:get_example/pages/lyrics/presentation/views/lyrics_view.dart';

import '../pages/home/bindings/home_binding.dart';
import '../pages/home/presentation/views/country_view.dart';
import '../pages/home/presentation/views/details_view.dart';
import '../pages/home/presentation/views/home_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
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
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        children: [
          GetPage(
            name: Routes.COUNTRY,
            page: () => CountryView(),
            children: [
              GetPage(
                name: Routes.DETAILS,
                page: () => DetailsView(),
              ),
            ],
          ),
        ]),
  ];
}
