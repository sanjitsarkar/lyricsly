import 'dart:convert';

class Artist {
  String artistName;
  String artistImage;
  int artistId;
  String artistInfoUrl;
  bool isVerified;
  bool isMemeVerified;
  int iq;
  Artist({
    required this.artistName,
    required this.artistImage,
    required this.artistId,
    required this.artistInfoUrl,
    required this.isVerified,
    required this.isMemeVerified,
    required this.iq,
  });

  Artist copyWith({
    String? artistName,
    String? artistImage,
    int? artistId,
    String? artistInfoUrl,
    bool? isVerified,
    bool? isMemeVerified,
    int? iq,
  }) {
    return Artist(
      artistName: artistName ?? this.artistName,
      artistImage: artistImage ?? this.artistImage,
      artistId: artistId ?? this.artistId,
      artistInfoUrl: artistInfoUrl ?? this.artistInfoUrl,
      isVerified: isVerified ?? this.isVerified,
      isMemeVerified: isMemeVerified ?? this.isMemeVerified,
      iq: iq ?? this.iq,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'artistName': artistName,
      'artistImage': artistImage,
      'artistId': artistId,
      'artistInfoUrl': artistInfoUrl,
      'isVerified': isVerified,
      'isMemeVerified': isMemeVerified,
      'iq': iq,
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      artistName: map['name'],
      artistImage: map['image_url'],
      artistId: map['id'],
      artistInfoUrl: map['url'],
      isVerified: map['is_verified'],
      isMemeVerified: map['is_meme_verified'],
      iq: map['iq'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) => Artist.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Artist(artistName: $artistName, artistImage: $artistImage, artistId: $artistId, artistInfoUrl: $artistInfoUrl, isVerified: $isVerified, isMemeVerified: $isMemeVerified, iq: $iq)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Artist &&
        other.artistName == artistName &&
        other.artistImage == artistImage &&
        other.artistId == artistId &&
        other.artistInfoUrl == artistInfoUrl &&
        other.isVerified == isVerified &&
        other.isMemeVerified == isMemeVerified &&
        other.iq == iq;
  }

  @override
  int get hashCode {
    return artistName.hashCode ^
        artistImage.hashCode ^
        artistId.hashCode ^
        artistInfoUrl.hashCode ^
        isVerified.hashCode ^
        isMemeVerified.hashCode ^
        iq.hashCode;
  }
}
