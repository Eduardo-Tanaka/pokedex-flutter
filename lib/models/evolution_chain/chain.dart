import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex/models/evolution_chain/evolution_details.dart';
import 'package:pokedex/models/evolution_chain/species.dart';

class Chain {
  final List<Chain> evolvesTo;
  final Species species;
  final List<EvolutionDetails> evolutionDetails;

  Chain({
    required this.evolvesTo,
    required this.species,
    required this.evolutionDetails,
  });

  Chain copyWith({
    List<Chain>? evolvesTo,
    Species? species,
    List<EvolutionDetails>? evolutionDetails,
  }) {
    return Chain(
      evolvesTo: evolvesTo ?? this.evolvesTo,
      species: species ?? this.species,
      evolutionDetails: evolutionDetails ?? this.evolutionDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'evolves_to': evolvesTo.map((x) => x.toMap()).toList(),
      'species': species.toMap(),
      'evolution_details': evolutionDetails.map((x) => x.toMap()).toList(),
    };
  }

  factory Chain.fromMap(Map<String, dynamic> map) {
    return Chain(
      evolvesTo:
          List<Chain>.from(map['evolves_to']?.map((x) => Chain.fromMap(x))),
      species: Species.fromMap(map['species']),
      evolutionDetails: List<EvolutionDetails>.from(
          map['evolution_details']?.map((x) => EvolutionDetails.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chain.fromJson(String source) => Chain.fromMap(json.decode(source));

  @override
  String toString() =>
      'Chain(evolvesTo: $evolvesTo, species: $species, evolutionDetails: $evolutionDetails)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chain &&
        listEquals(other.evolvesTo, evolvesTo) &&
        other.species == species &&
        listEquals(other.evolutionDetails, evolutionDetails);
  }

  @override
  int get hashCode =>
      evolvesTo.hashCode ^ species.hashCode ^ evolutionDetails.hashCode;
}
