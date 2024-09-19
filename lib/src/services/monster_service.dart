
import 'api_service.dart';
import '../models/monster_model.dart';

class MonsterService {
  final ApiService apiService = ApiService();

   Future<List<Monster>> fetchMonsterDetailsByArchetype(String archetypeName) async {
      try {
        return await apiService.getData(
          'cardinfo.php?archetype=$archetypeName', 
          (json) => Monster.fromJson(json),
          );
      } catch(error) {
        throw Exception('Failed to load monsters');
      }
  }

  Future<List<Monster>> fetchBanlist() async {
    try {
      // Usamos getData para obtener la lista de cartas de la banlist

      return await apiService.getData(
        'cardinfo.php?banlist=tcg',  // Endpoint específico de la banlist
        (json) => Monster.fromJson(json),  // Convertimos el JSON a objetos Monster
      );
    } catch (error) {
      print('Error fetching banlist: $error');
      return [];  // Devolvemos una lista vacía en caso de error
    }
  }
}
