import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex/models/pokemon_species/color.dart';
import 'package:pokedex/models/pokemon_species/egg_group.dart';
import 'package:pokedex/models/pokemon_species/evolution_chain.dart';
import 'package:pokedex/models/pokemon_species/flavor_text_entry.dart';

class PokemonSpeciesResponse {
  final Color color;
  final EvolutionChain evolutionChain;
  final List<EggGroup> eggGroups;
  final List<FlavorTextEntry> flavorTextEntries;

  PokemonSpeciesResponse({
    required this.color,
    required this.evolutionChain,
    required this.eggGroups,
    required this.flavorTextEntries,
  });

  PokemonSpeciesResponse copyWith({
    Color? color,
    EvolutionChain? evolutionChain,
    List<EggGroup>? eggGroups,
    List<FlavorTextEntry>? flavorTextEntries,
  }) {
    return PokemonSpeciesResponse(
      color: color ?? this.color,
      evolutionChain: evolutionChain ?? this.evolutionChain,
      eggGroups: eggGroups ?? this.eggGroups,
      flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color.toMap(),
      'evolution_chain': evolutionChain.toMap(),
      'egg_groups': eggGroups.map((x) => x.toMap()).toList(),
      'flavor_text_entries': flavorTextEntries.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonSpeciesResponse.fromMap(Map<String, dynamic> map) {
    return PokemonSpeciesResponse(
      color: Color.fromMap(map['color']),
      evolutionChain: EvolutionChain.fromMap(map['evolution_chain']),
      eggGroups: List<EggGroup>.from(
          map['egg_groups']?.map((x) => EggGroup.fromMap(x))),
      flavorTextEntries: List<FlavorTextEntry>.from(
          map['flavor_text_entries']?.map((x) => FlavorTextEntry.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpeciesResponse.fromJson(String source) =>
      PokemonSpeciesResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonSpeciesResponse(color: $color, evolutionChain: $evolutionChain, eggGroups: $eggGroups, flavorTextEntries: $flavorTextEntries)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonSpeciesResponse &&
        other.color == color &&
        other.evolutionChain == evolutionChain &&
        listEquals(other.eggGroups, eggGroups) &&
        listEquals(other.flavorTextEntries, flavorTextEntries);
  }

  @override
  int get hashCode {
    return color.hashCode ^
        evolutionChain.hashCode ^
        eggGroups.hashCode ^
        flavorTextEntries.hashCode;
  }
}
