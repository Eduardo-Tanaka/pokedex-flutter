import 'dart:convert';

import 'package:pokedex/models/type/damage_relations.dart';

class TypeResponse {
  final DamageRelations damageRelations;

  TypeResponse({
    required this.damageRelations,
  });

  TypeResponse copyWith({
    DamageRelations? damageRelations,
  }) {
    return TypeResponse(
      damageRelations: damageRelations ?? this.damageRelations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'damage_relations': damageRelations.toMap(),
    };
  }

  factory TypeResponse.fromMap(Map<String, dynamic> map) {
    return TypeResponse(
      damageRelations: DamageRelations.fromMap(map['damage_relations']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeResponse.fromJson(String source) =>
      TypeResponse.fromMap(json.decode(source));

  @override
  String toString() => 'TypeResponse(damageRelations: $damageRelations)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeResponse && other.damageRelations == damageRelations;
  }

  @override
  int get hashCode => damageRelations.hashCode;
}
