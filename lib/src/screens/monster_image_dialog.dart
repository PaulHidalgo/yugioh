import 'package:flutter/material.dart';
import '../models/monster_model.dart';

class MonsterImageDialog extends StatefulWidget {
  final Monster monster;

  MonsterImageDialog({Key? key, required this.monster}) : super(key: key);

  @override
  _MonsterImageDialogState createState() => _MonsterImageDialogState();
}

class _MonsterImageDialogState extends State<MonsterImageDialog> {
  bool _showAlternativeImage = false;  // Variable para controlar qué imagen mostrar

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.monster.name),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _showAlternativeImage = !_showAlternativeImage;  // Cambia entre imágenes
                });
              },
              child: AnimatedOpacity(
                opacity: _showAlternativeImage ? 1.0 : 0.7,  // Efecto de opacidad
                duration: Duration(milliseconds: 500),
                child: Image.network(
                  _showAlternativeImage
                      ? widget.monster.cardImages[0].imageUrlCropped  // URL de la imagen alternativa
                      : widget.monster.imageUrl,  // Imagen original
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'ATK: ${widget.monster.atk} | DEF: ${widget.monster.def}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Description:'),
            Text(widget.monster.description),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
