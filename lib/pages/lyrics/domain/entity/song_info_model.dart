import 'dart:convert';

import 'artist_model.dart';
import 'stats_model.dart';

class SongInfo {
  Artist artist;
  String songTitle;
  String songArtUrl;
  String lyricsUrl;
  int lyricsId;
  String songArtPrimaryColor;
  String songArtSecondaryColor;
  String songArtTextColor;
  Stats? stats;
  SongInfo({
    required this.artist,
    required this.songTitle,
    required this.songArtUrl,
    required this.lyricsUrl,
    required this.lyricsId,
    required this.songArtPrimaryColor,
    required this.songArtSecondaryColor,
    required this.songArtTextColor,
    required this.stats,
  });

  SongInfo copyWith({
    Artist? artist,
    String? songTitle,
    String? songArtUrl,
    String? lyricsUrl,
    int? lyricsId,
    String? songArtPrimaryColor,
    String? songArtSecondaryColor,
    String? songArtTextColor,
    Stats? stats,
  }) {
    return SongInfo(
      artist: artist ?? this.artist,
      songTitle: songTitle ?? this.songTitle,
      songArtUrl: songArtUrl ?? this.songArtUrl,
      lyricsUrl: lyricsUrl ?? this.lyricsUrl,
      lyricsId: lyricsId ?? this.lyricsId,
      songArtPrimaryColor: songArtPrimaryColor ?? this.songArtPrimaryColor,
      songArtSecondaryColor:
          songArtSecondaryColor ?? this.songArtSecondaryColor,
      songArtTextColor: songArtTextColor ?? this.songArtTextColor,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'artist': artist.toMap(),
      'songTitle': songTitle,
      'songArtUrl': songArtUrl,
      'lyricsUrl': lyricsUrl,
      'lyricsId': lyricsId,
      'songArtPrimaryColor': songArtPrimaryColor,
      'songArtSecondaryColor': songArtSecondaryColor,
      'songArtTextColor': songArtTextColor,
      'stats': stats?.toMap(),
    };
  }

  factory SongInfo.fromMap(Map<String, dynamic> map) {
    return SongInfo(
      artist: Artist.fromMap(map['primary_artist']),
      songTitle: map['full_title'],
      songArtUrl: map['song_art_image_url'],
      lyricsId: map['id'] ?? 0,
      songArtPrimaryColor: map['song_art_primary_color'] ?? "#FFFF",
      songArtSecondaryColor: map['song_art_secondary_color'] ?? "#0000",
      songArtTextColor: map['song_art_text_color'] ?? "#EEEE",
      stats: Stats.fromMap(map['stats']),
      lyricsUrl: map["url"],
    );
  }

  String toJson() => json.encode(toMap());

  factory SongInfo.fromJson(String source) =>
      SongInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SongInfo(artist: $artist, songTitle: $songTitle, songArtUrl: $songArtUrl, lyricsUrl: $lyricsUrl, lyricsId: $lyricsId, songArtPrimaryColor: $songArtPrimaryColor, songArtSecondaryColor: $songArtSecondaryColor, songArtTextColor: $songArtTextColor, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SongInfo &&
        other.artist == artist &&
        other.songTitle == songTitle &&
        other.songArtUrl == songArtUrl &&
        other.lyricsUrl == lyricsUrl &&
        other.lyricsId == lyricsId &&
        other.songArtPrimaryColor == songArtPrimaryColor &&
        other.songArtSecondaryColor == songArtSecondaryColor &&
        other.songArtTextColor == songArtTextColor &&
        other.stats == stats;
  }

  @override
  int get hashCode {
    return artist.hashCode ^
        songTitle.hashCode ^
        songArtUrl.hashCode ^
        lyricsUrl.hashCode ^
        lyricsId.hashCode ^
        songArtPrimaryColor.hashCode ^
        songArtSecondaryColor.hashCode ^
        songArtTextColor.hashCode ^
        stats.hashCode;
  }
}
