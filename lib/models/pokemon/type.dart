import 'dart:convert';

class Type {
  final String name;
  final String url;

  Type({
    required this.name,
    required this.url,
  });

  Type copyWith({
    String? name,
    String? url,
  }) {
    return Type(
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

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Type.fromJson(String source) => Type.fromMap(json.decode(source));

  @override
  String toString() => 'Type(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Type && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
