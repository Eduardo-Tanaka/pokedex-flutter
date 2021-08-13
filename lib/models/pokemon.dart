import 'dart:convert';

import 'package:pokedex/models/pokemon/pokemon_response.dart';
import 'package:pokedex/models/pokemon_species/pokemon_species_response.dart';

import 'evolution_chain/evolution_chain_response.dart';

class Pokemon {
  final PokemonResponse pokemon;
  final PokemonSpeciesResponse pokemonSpecies;
  final EvolutionChainResponse evolutionChain;
  final int id;

  Pokemon({
    required this.pokemon,
    required this.pokemonSpecies,
    required this.evolutionChain,
    required this.id,
  });

  Pokemon copyWith({
    PokemonResponse? pokemon,
    PokemonSpeciesResponse? pokemonSpecies,
    EvolutionChainResponse? evolutionChain,
    int? id,
  }) {
    return Pokemon(
      pokemon: pokemon ?? this.pokemon,
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
      evolutionChain: evolutionChain ?? this.evolutionChain,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pokemon': pokemon.toMap(),
      'pokemonSpecies': pokemonSpecies.toMap(),
      'evolutionChain': evolutionChain.toMap(),
      'id': id,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      pokemon: PokemonResponse.fromMap(map['pokemon']),
      pokemonSpecies: PokemonSpeciesResponse.fromMap(map['pokemonSpecies']),
      evolutionChain: EvolutionChainResponse.fromMap(map['evolutionChain']),
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pokemon(pokemon: $pokemon, pokemonSpecies: $pokemonSpecies, evolutionChain: $evolutionChain, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pokemon &&
        other.pokemon == pokemon &&
        other.pokemonSpecies == pokemonSpecies &&
        other.evolutionChain == evolutionChain &&
        other.id == id;
  }

  @override
  int get hashCode {
    return pokemon.hashCode ^
        pokemonSpecies.hashCode ^
        evolutionChain.hashCode ^
        id.hashCode;
  }
}
