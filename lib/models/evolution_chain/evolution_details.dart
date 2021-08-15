import 'dart:convert';

import 'package:pokedex/models/evolution_chain/item.dart';

class EvolutionDetails {
  final int? minLevel;
  final Item? item;
  final Item? heldItem;

  EvolutionDetails({
    this.minLevel,
    this.item,
    this.heldItem,
  });

  EvolutionDetails copyWith({
    int? minLevel,
    Item? item,
    Item? heldItem,
  }) {
    return EvolutionDetails(
      minLevel: minLevel ?? this.minLevel,
      item: item ?? this.item,
      heldItem: heldItem ?? this.heldItem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'min_level': minLevel,
      'item': item?.toMap(),
      'held_item': heldItem?.toMap(),
    };
  }

  factory EvolutionDetails.fromMap(Map<String, dynamic> map) {
    return EvolutionDetails(
      minLevel: map['min_level'],
      item: map['item'] == null ? null : Item.fromMap(map['item']),
      heldItem:
          map['held_item'] == null ? null : Item.fromMap(map['held_item']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionDetails.fromJson(String source) =>
      EvolutionDetails.fromMap(json.decode(source));

  @override
  String toString() =>
      'EvolutionDetails(minLevel: $minLevel, item: $item, heldItem: $heldItem)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EvolutionDetails &&
        other.minLevel == minLevel &&
        other.item == item &&
        other.heldItem == heldItem;
  }

  @override
  int get hashCode => minLevel.hashCode ^ item.hashCode ^ heldItem.hashCode;
}
