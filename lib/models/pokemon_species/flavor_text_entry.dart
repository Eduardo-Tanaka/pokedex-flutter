import 'dart:convert';

import 'package:pokedex/models/pokemon_species/final_version.dart';

class FlavorTextEntry {
  final String flavorText;
  final Version version;

  FlavorTextEntry({
    required this.flavorText,
    required this.version,
  });

  FlavorTextEntry copyWith({
    String? flavorText,
    Version? version,
  }) {
    return FlavorTextEntry(
      flavorText: flavorText ?? this.flavorText,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'flavor_text': flavorText,
      'version': version.toMap(),
    };
  }

  factory FlavorTextEntry.fromMap(Map<String, dynamic> map) {
    return FlavorTextEntry(
      flavorText: map['flavor_text'],
      version: Version.fromMap(map['version']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FlavorTextEntry.fromJson(String source) =>
      FlavorTextEntry.fromMap(json.decode(source));

  @override
  String toString() =>
      'FlavorTextEntry(flavorText: $flavorText, version: $version)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlavorTextEntry &&
        other.flavorText == flavorText &&
        other.version == version;
  }

  @override
  int get hashCode => flavorText.hashCode ^ version.hashCode;
}
