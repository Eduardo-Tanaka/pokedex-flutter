import 'dart:convert';

class Color {
  final String name;
  final String url;

  Color({
    required this.name,
    required this.url,
  });

  Color copyWith({
    String? name,
    String? url,
  }) {
    return Color(
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

  factory Color.fromMap(Map<String, dynamic> map) {
    return Color(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Color.fromJson(String source) => Color.fromMap(json.decode(source));

  @override
  String toString() => 'Color(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Color && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
