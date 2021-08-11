import 'dart:convert';

class OfficialArtwork {
  final String frontDefault;

  OfficialArtwork({
    required this.frontDefault,
  });

  OfficialArtwork copyWith({
    String? frontDefault,
  }) {
    return OfficialArtwork(
      frontDefault: frontDefault ?? this.frontDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': frontDefault,
    };
  }

  factory OfficialArtwork.fromMap(Map<String, dynamic> map) {
    return OfficialArtwork(
      frontDefault: map['front_default'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficialArtwork.fromJson(String source) =>
      OfficialArtwork.fromMap(json.decode(source));

  @override
  String toString() => 'OfficialArtwork(frontDefault: $frontDefault)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfficialArtwork && other.frontDefault == frontDefault;
  }

  @override
  int get hashCode => frontDefault.hashCode;
}
