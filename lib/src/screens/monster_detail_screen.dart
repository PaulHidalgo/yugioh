import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/monster_provider.dart';
import '../models/monster_model.dart';
import 'monster_image_dialog.dart';

class MonsterDetailScreen extends StatefulWidget {
  final String archetypeName;

  MonsterDetailScreen({required this.archetypeName});

  @override
  _MonsterDetailScreenState createState() => _MonsterDetailScreenState();
}

class _MonsterDetailScreenState extends State<MonsterDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Llamamos al provider para obtener los detalles del arquetipo al cargar la pantalla
    Provider.of<MonsterProvider>(context, listen: false)
        .fetchMonsterDetails(widget.archetypeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monsters from ${widget.archetypeName}'),
      ),
      body: Consumer<MonsterProvider>(
        builder: (context, monsterProvider, child) {
          if (monsterProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (monsterProvider.monsters.isEmpty) {
            return Center(
              child: Text('No monsters available for this archetype'),
            );
          } else {
            return ListView.builder(
              itemCount: monsterProvider.monsters.length,
              itemBuilder: (context, index) {
                final monster = monsterProvider.monsters[index];
                return Card(
                  child: ListTile(
                    title: Text(monster.name),
                    subtitle: Text('ATK: ${monster.atk} | DEF: ${monster.def}'),
                    leading: Image.network(monster.imageUrl),
                    onTap: () {
                       _showMonsterDetailDialog(context, monster);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _showMonsterDetailDialog(BuildContext context, Monster monster) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MonsterImageDialog(monster: monster);
      },
    );
  }
  
}