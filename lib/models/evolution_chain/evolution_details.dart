import 'dart:convert';

class EvolutionDetails {
  final int? minLevel;

  EvolutionDetails({
    this.minLevel,
  });

  EvolutionDetails copyWith({
    int? minLevel,
  }) {
    return EvolutionDetails(
      minLevel: minLevel ?? this.minLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'min_level': minLevel,
    };
  }

  factory EvolutionDetails.fromMap(Map<String, dynamic> map) {
    return EvolutionDetails(
      minLevel: map['min_level'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionDetails.fromJson(String source) =>
      EvolutionDetails.fromMap(json.decode(source));

  @override
  String toString() => 'EvolutionDetails(minLevel: $minLevel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EvolutionDetails && other.minLevel == minLevel;
  }

  @override
  int get hashCode => minLevel.hashCode;
}
