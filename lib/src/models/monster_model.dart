class Monster {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int atk;
  final int def;
  final List<String> abilities;
  final String type;
  final List<CardImage> cardImages;

  Monster({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.atk,
    required this.def,
    required this.abilities,
    required this.type,
    required this.cardImages,
  });

  factory Monster.fromJson(Map<String, dynamic> json) {
    return Monster(
      id: json['id'],
      name: json['name'],
      description: json['desc'],
      imageUrl: json['card_images'][0]['image_url'],
      atk: (json['atk'] as int?) ?? 0,
      def: (json['def'] as int?) ?? 0,
      abilities: List<String>.from(json['card_effects'] ?? []),
      type: json['type'],
      cardImages: (json['card_images'] as List)
          .map((image) => CardImage.fromJson(image))
          .toList(),
    );
  }
}

class CardImage {
  final int id;
  final String imageUrl;
  final String imageUrlSmall;
  final String imageUrlCropped;

  CardImage({
    required this.id,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,
  });

  factory CardImage.fromJson(Map<String, dynamic> json) {
    return CardImage(
      id: json['id'],
      imageUrl: json['image_url'],
      imageUrlSmall: json['image_url_small'],
      imageUrlCropped: json['image_url_cropped'],
    );
  }
}
