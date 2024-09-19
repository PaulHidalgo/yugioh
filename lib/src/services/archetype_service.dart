import 'api_service.dart';
import '../models/archetype_model.dart';

class ArchetypeService {
  final ApiService apiService = ApiService();

  Future<List<Archetype>> fetchArchetypes() async {
    final data = await apiService.get('archetypes.php');
    return (data as List).map((json) => Archetype.fromJson(json)).toList();
  }
}
