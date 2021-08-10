import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex/models/pokemon_species.dart';

class PokemonGenerationResponse {
  final List<PokemonSpecies> pokemonSpecies;

  PokemonGenerationResponse({
    required this.pokemonSpecies,
  });

  PokemonGenerationResponse copyWith({
    List<PokemonSpecies>? pokemonSpecies,
  }) {
    return PokemonGenerationResponse(
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pokemon_species': pokemonSpecies.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonGenerationResponse.fromMap(Map<String, dynamic> map) {
    return PokemonGenerationResponse(
      pokemonSpecies: List<PokemonSpecies>.from(
          map['pokemon_species']?.map((x) => PokemonSpecies.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonGenerationResponse.fromJson(String source) =>
      PokemonGenerationResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonGenerationResponse(pokemonSpecies: $pokemonSpecies)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonGenerationResponse &&
        listEquals(other.pokemonSpecies, pokemonSpecies);
  }

  @override
  int get hashCode => pokemonSpecies.hashCode;
}
