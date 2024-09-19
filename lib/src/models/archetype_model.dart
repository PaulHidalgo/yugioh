class Archetype {
  final String name;

  Archetype({required this.name});

  factory Archetype.fromJson(Map<String, dynamic> json) {
    return Archetype(
      name: json['archetype_name'],
    );
  }
}
