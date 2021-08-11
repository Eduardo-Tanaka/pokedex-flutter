import 'dart:convert';

import 'package:pokedex/models/pokemon/official_artwork.dart';

class Other {
  final OfficialArtwork officialArtwork;

  Other({
    required this.officialArtwork,
  });

  Other copyWith({
    OfficialArtwork? officialArtwork,
  }) {
    return Other(
      officialArtwork: officialArtwork ?? this.officialArtwork,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'official_artwork': officialArtwork.toMap(),
    };
  }

  factory Other.fromMap(Map<String, dynamic> map) {
    return Other(
      officialArtwork: OfficialArtwork.fromMap(map['official_artwork']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Other.fromJson(String source) => Other.fromMap(json.decode(source));

  @override
  String toString() => 'Other(officialArtwork: $officialArtwork)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Other && other.officialArtwork == officialArtwork;
  }

  @override
  int get hashCode => officialArtwork.hashCode;
}
