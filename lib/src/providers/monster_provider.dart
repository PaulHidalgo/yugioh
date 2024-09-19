import 'package:flutter/material.dart';
import '../models/monster_model.dart';
import '../services/monster_service.dart';

class MonsterProvider with ChangeNotifier {
  final MonsterService _monsterService = MonsterService();

  List<Monster> _monsters = [];
  List<Monster> get monsters => _monsters;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchMonsterDetails(String archetypeName) async {
    _isLoading = true;
    notifyListeners();

    try {
    // Llamamos a ambos servicios en paralelo
    final List<Monster> banlistData = await _monsterService.fetchBanlist(); 
    final List<Monster> monsterData = await _monsterService.fetchMonsterDetailsByArchetype(archetypeName);

    // Crear un conjunto de IDs de monstruos en la banlist para filtrar más rápido
    final Set<int> bannedMonsterIds = banlistData.map((monster) => monster.id).toSet();

    // Filtrar los monstruos que NO estén en la banlist
    List<Monster> filteredMonsters = monsterData.where((monster) => !bannedMonsterIds.contains(monster.id)).toList();

    _monsters = filteredMonsters;

    } catch (error) {
      _monsters = [];
      print("Error fetching monsters: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearMonsters() {
    _monsters = [];
    notifyListeners();
  }
}
