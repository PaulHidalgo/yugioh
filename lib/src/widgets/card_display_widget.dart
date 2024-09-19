import 'package:flutter/material.dart';

class CardDisplayWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int atk;
  final int def;
  final String description;

  CardDisplayWidget({
    required this.imageUrl,
    required this.name,
    required this.atk,
    required this.def,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('ATK: $atk / DEF: $def'),
          Text(description),
        ],
      ),
    );
  }
}
