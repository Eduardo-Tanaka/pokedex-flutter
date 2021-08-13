import 'dart:convert';

class EggGroup {
  final String name;
  final String url;

  EggGroup({
    required this.name,
    required this.url,
  });

  EggGroup copyWith({
    String? name,
    String? url,
  }) {
    return EggGroup(
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

  factory EggGroup.fromMap(Map<String, dynamic> map) {
    return EggGroup(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EggGroup.fromJson(String source) =>
      EggGroup.fromMap(json.decode(source));

  @override
  String toString() => 'EggGroup(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EggGroup && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
