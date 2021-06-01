import 'package:lyricsly/pages/lyrics/domain/adapters/repository_adapter.dart';
import 'package:lyricsly/pages/lyrics/domain/entity/song_info_model.dart';

import 'lyrics_api_provider.dart';

class LyricsRepository implements ILyricsRepository {
  LyricsRepository({required this.provider});
  final ILyricsProvider provider;

  @override
  Future<List<SongInfo>> getSongInfo(String search) async {
    final cases = await provider.getSongInfo("/search", search);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}
