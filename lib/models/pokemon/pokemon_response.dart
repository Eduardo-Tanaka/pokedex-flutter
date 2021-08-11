import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex/models/pokemon/sprites.dart';
import 'package:pokedex/models/pokemon/stats.dart';
import 'package:pokedex/models/pokemon/types.dart';

class PokemonResponse {
  final int height;
  final int weight;
  final String name;
  final Sprites sprites;
  final List<Stats> stats;
  final List<Types> types;

  PokemonResponse({
    required this.height,
    required this.weight,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.types,
  });

  PokemonResponse copyWith({
    int? height,
    int? weight,
    String? name,
    Sprites? sprites,
    List<Stats>? stats,
    List<Types>? types,
  }) {
    return PokemonResponse(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      name: name ?? this.name,
      sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'weight': weight,
      'name': name,
      'sprites': sprites.toMap(),
      'stats': stats.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonResponse.fromMap(Map<String, dynamic> map) {
    return PokemonResponse(
      height: map['height'],
      weight: map['weight'],
      name: map['name'],
      sprites: Sprites.fromMap(map['sprites']),
      stats: List<Stats>.from(map['stats']?.map((x) => Stats.fromMap(x))),
      types: List<Types>.from(map['types']?.map((x) => Types.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonResponse.fromJson(String source) =>
      PokemonResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonResponse(height: $height, weight: $weight, name: $name, sprites: $sprites, stats: $stats, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonResponse &&
        other.height == height &&
        other.weight == weight &&
        other.name == name &&
        other.sprites == sprites &&
        listEquals(other.stats, stats) &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode {
    return height.hashCode ^
        weight.hashCode ^
        name.hashCode ^
        sprites.hashCode ^
        stats.hashCode ^
        types.hashCode;
  }
}
