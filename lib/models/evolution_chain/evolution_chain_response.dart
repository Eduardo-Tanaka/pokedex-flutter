import 'dart:convert';

import 'package:pokedex/models/evolution_chain/chain.dart';

class EvolutionChainResponse {
  final Chain chain;

  EvolutionChainResponse({
    required this.chain,
  });

  EvolutionChainResponse copyWith({
    Chain? chain,
  }) {
    return EvolutionChainResponse(
      chain: chain ?? this.chain,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chain': chain.toMap(),
    };
  }

  factory EvolutionChainResponse.fromMap(Map<String, dynamic> map) {
    return EvolutionChainResponse(
      chain: Chain.fromMap(map['chain']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionChainResponse.fromJson(String source) =>
      EvolutionChainResponse.fromMap(json.decode(source));

  @override
  String toString() => 'EvolutionChainResponse(chain: $chain)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EvolutionChainResponse && other.chain == chain;
  }

  @override
  int get hashCode => chain.hashCode;
}
