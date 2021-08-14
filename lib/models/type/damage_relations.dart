import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex/models/type/damage.dart';

class DamageRelations {
  List<Damage> doubleDamageFrom;
  List<Damage> halfDamageFrom;

  DamageRelations({
    required this.doubleDamageFrom,
    required this.halfDamageFrom,
  });

  DamageRelations copyWith({
    List<Damage>? doubleDamageFrom,
    List<Damage>? halfDamageFrom,
  }) {
    return DamageRelations(
      doubleDamageFrom: doubleDamageFrom ?? this.doubleDamageFrom,
      halfDamageFrom: halfDamageFrom ?? this.halfDamageFrom,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'double_damage_from': doubleDamageFrom.map((x) => x.toMap()).toList(),
      'half_damage_from': halfDamageFrom.map((x) => x.toMap()).toList(),
    };
  }

  factory DamageRelations.fromMap(Map<String, dynamic> map) {
    return DamageRelations(
      doubleDamageFrom: List<Damage>.from(
          map['double_damage_from']?.map((x) => Damage.fromMap(x))),
      halfDamageFrom: List<Damage>.from(
          map['half_damage_from']?.map((x) => Damage.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DamageRelations.fromJson(String source) =>
      DamageRelations.fromMap(json.decode(source));

  @override
  String toString() =>
      'DamageRelations(doubleDamageFrom: $doubleDamageFrom, halfDamageFrom: $halfDamageFrom)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DamageRelations &&
        listEquals(other.doubleDamageFrom, doubleDamageFrom) &&
        listEquals(other.halfDamageFrom, halfDamageFrom);
  }

  @override
  int get hashCode => doubleDamageFrom.hashCode ^ halfDamageFrom.hashCode;
}
