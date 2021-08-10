import 'dart:convert';

class PokemonSpecies {
  final String name;
  final String url;

  PokemonSpecies({
    required this.name,
    required this.url,
  });

  PokemonSpecies copyWith({
    String? name,
    String? url,
  }) {
    return PokemonSpecies(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonSpecies.fromMap(Map<String, dynamic> map) {
    return PokemonSpecies(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpecies.fromJson(String source) =>
      PokemonSpecies.fromMap(json.decode(source));

  @override
  String toString() => 'PokemonSpecies(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonSpecies && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
