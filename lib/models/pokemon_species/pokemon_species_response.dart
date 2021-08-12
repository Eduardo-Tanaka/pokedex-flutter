import 'dart:convert';

import 'package:pokedex/models/pokemon_species/color.dart';

class PokemonSpeciesResponse {
  final Color color;

  PokemonSpeciesResponse({
    required this.color,
  });

  PokemonSpeciesResponse copyWith({
    Color? color,
  }) {
    return PokemonSpeciesResponse(
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color.toMap(),
    };
  }

  factory PokemonSpeciesResponse.fromMap(Map<String, dynamic> map) {
    return PokemonSpeciesResponse(
      color: Color.fromMap(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpeciesResponse.fromJson(String source) =>
      PokemonSpeciesResponse.fromMap(json.decode(source));

  @override
  String toString() => 'PokemonSpeciesResponse(color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonSpeciesResponse && other.color == color;
  }

  @override
  int get hashCode => color.hashCode;
}
