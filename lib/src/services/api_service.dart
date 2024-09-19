import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://db.ygoprodeck.com/api/v7/";

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }

 Future<List<T>> getData<T>(String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];

      return data.map((item) => fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener los datos: ${response.statusCode}');
    }
  }
}
