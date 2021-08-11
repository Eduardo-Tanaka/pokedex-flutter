import 'dart:convert';

class Stat {
  final String name;
  final String url;

  Stat({
    required this.name,
    required this.url,
  });

  Stat copyWith({
    String? name,
    String? url,
  }) {
    return Stat(
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

  factory Stat.fromMap(Map<String, dynamic> map) {
    return Stat(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Stat.fromJson(String source) => Stat.fromMap(json.decode(source));

  @override
  String toString() => 'Stat(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stat && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
