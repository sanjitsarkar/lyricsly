import 'package:get/get.dart';
import 'package:get_example/pages/lyrics/domain/entity/song_info_model.dart';
// ignore: one_member_abstracts
abstract class ILyricsProvider {
  Future<Response<List<SongInfo>>> getSongInfo(String path, String search);
}

class LyricsProvider extends GetConnect implements ILyricsProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) {
      
      return List<SongInfo>.from(
          val["response"]["hits"].map((x) => SongInfo.fromMap(x["result"])));
    };
    httpClient.baseUrl = 'https://genius.p.rapidapi.com';

    httpClient.addRequestModifier<dynamic>((request) {
      request.headers["x-rapidapi-key"] =
          "3f1e7e1923mshe8b1859a35f6c65p13a1f7jsn1d1a0643f170";
      request.headers["x-rapidapi-host"] = "genius.p.rapidapi.com/";
      request.headers["useQueryString"] = "true";

      return request;
    });
    httpClient.maxAuthRetries = 3;
  }

  @override
  Future<Response<List<SongInfo>>> getSongInfo(String path, String search) =>
      get(path, query: {"q": search});
}
