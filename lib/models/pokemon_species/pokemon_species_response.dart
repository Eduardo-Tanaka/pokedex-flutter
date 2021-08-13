import 'dart:convert';

import 'package:pokedex/models/pokemon_species/color.dart';
import 'package:pokedex/models/pokemon_species/evolution_chain.dart';

class PokemonSpeciesResponse {
  final Color color;
  final EvolutionChain evolutionChain;

  PokemonSpeciesResponse({
    required this.color,
    required this.evolutionChain,
  });

  PokemonSpeciesResponse copyWith({
    Color? color,
    EvolutionChain? evolutionChain,
  }) {
    return PokemonSpeciesResponse(
      color: color ?? this.color,
      evolutionChain: evolutionChain ?? this.evolutionChain,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color.toMap(),
      'evolution_chain': evolutionChain.toMap(),
    };
  }

  factory PokemonSpeciesResponse.fromMap(Map<String, dynamic> map) {
    return PokemonSpeciesResponse(
      color: Color.fromMap(map['color']),
      evolutionChain: EvolutionChain.fromMap(map['evolution_chain']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpeciesResponse.fromJson(String source) =>
      PokemonSpeciesResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonSpeciesResponse(color: $color, evolutionChain: $evolutionChain)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonSpeciesResponse &&
        other.color == color &&
        other.evolutionChain == evolutionChain;
  }

  @override
  int get hashCode => color.hashCode ^ evolutionChain.hashCode;
}
