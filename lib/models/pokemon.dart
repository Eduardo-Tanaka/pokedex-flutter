import 'dart:convert';

import 'package:pokedex/models/pokemon/pokemon_response.dart';
import 'package:pokedex/models/pokemon_species/pokemon_species_response.dart';

class Pokemon {
  final PokemonResponse pokemon;
  final PokemonSpeciesResponse pokemonSpecies;
  final int id;

  Pokemon({
    required this.pokemon,
    required this.pokemonSpecies,
    required this.id,
  });

  Pokemon copyWith({
    PokemonResponse? pokemon,
    PokemonSpeciesResponse? pokemonSpecies,
    int? id,
  }) {
    return Pokemon(
      pokemon: pokemon ?? this.pokemon,
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pokemon': pokemon.toMap(),
      'pokemonSpecies': pokemonSpecies.toMap(),
      'id': id,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      pokemon: PokemonResponse.fromMap(map['pokemon']),
      pokemonSpecies: PokemonSpeciesResponse.fromMap(map['pokemonSpecies']),
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));

  @override
  String toString() =>
      'Pokemon(pokemon: $pokemon, pokemonSpecies: $pokemonSpecies, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pokemon &&
        other.pokemon == pokemon &&
        other.pokemonSpecies == pokemonSpecies &&
        other.id == id;
  }

  @override
  int get hashCode => pokemon.hashCode ^ pokemonSpecies.hashCode ^ id.hashCode;
}
