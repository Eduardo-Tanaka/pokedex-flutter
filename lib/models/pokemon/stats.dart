import 'dart:convert';

import 'package:pokedex/models/pokemon/stat.dart';

class Stats {
  final int baseStat;
  final int effort;
  final Stat stat;

  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  Stats copyWith({
    int? baseStat,
    int? effort,
    Stat? stat,
  }) {
    return Stats(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStat: map['base_stat'],
      effort: map['effort'],
      stat: Stat.fromMap(map['stat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Stats.fromJson(String source) => Stats.fromMap(json.decode(source));

  @override
  String toString() =>
      'Stats(baseStat: $baseStat, effort: $effort, stat: $stat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stats &&
        other.baseStat == baseStat &&
        other.effort == effort &&
        other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}
