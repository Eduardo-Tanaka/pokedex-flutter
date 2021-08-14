import 'dart:convert';

class Damage {
  final String name;
  final String url;

  Damage({
    required this.name,
    required this.url,
  });

  Damage copyWith({
    String? name,
    String? url,
  }) {
    return Damage(
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

  factory Damage.fromMap(Map<String, dynamic> map) {
    return Damage(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Damage.fromJson(String source) => Damage.fromMap(json.decode(source));

  @override
  String toString() => 'Damage(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Damage && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
