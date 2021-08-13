import 'dart:convert';

class EvolutionChain {
  final String url;

  EvolutionChain({
    required this.url,
  });

  EvolutionChain copyWith({
    String? url,
  }) {
    return EvolutionChain(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory EvolutionChain.fromMap(Map<String, dynamic> map) {
    return EvolutionChain(
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionChain.fromJson(String source) =>
      EvolutionChain.fromMap(json.decode(source));

  @override
  String toString() => 'EvolutionChain(url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EvolutionChain && other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
