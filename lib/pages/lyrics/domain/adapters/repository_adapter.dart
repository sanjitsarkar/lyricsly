import 'package:get_example/pages/lyrics/domain/entity/song_info_model.dart';

abstract class ILyricsRepository {
  Future<List<SongInfo>> getSongInfo(String search);
}
