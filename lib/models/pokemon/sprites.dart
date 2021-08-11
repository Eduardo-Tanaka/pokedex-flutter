import 'dart:convert';

import 'other.dart';

class Sprites {
  final Other other;

  Sprites({
    required this.other,
  });

  Sprites copyWith({
    Other? other,
  }) {
    return Sprites(
      other: other ?? this.other,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'other': other.toMap(),
    };
  }

  factory Sprites.fromMap(Map<String, dynamic> map) {
    return Sprites(
      other: Other.fromMap(map['other']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sprites.fromJson(String source) =>
      Sprites.fromMap(json.decode(source));

  @override
  String toString() => 'Sprites(other: $other)';

  @override
  bool operator ==(Object obj) {
    if (identical(this, obj)) return true;

    return obj is Sprites && obj.other == other;
  }

  @override
  int get hashCode => other.hashCode;
}
