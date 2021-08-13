import 'dart:convert';

class Version {
  final String name;
  final String url;

  Version({
    required this.name,
    required this.url,
  });

  Version copyWith({
    String? name,
    String? url,
  }) {
    return Version(
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

  factory Version.fromMap(Map<String, dynamic> map) {
    return Version(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Version.fromJson(String source) =>
      Version.fromMap(json.decode(source));

  @override
  String toString() => 'Version(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Version && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
