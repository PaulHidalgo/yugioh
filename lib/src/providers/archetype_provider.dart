import 'package:flutter/material.dart';
import '../services/archetype_service.dart';
import '../models/archetype_model.dart';

class ArchetypeProvider extends ChangeNotifier {
  final ArchetypeService archetypeService = ArchetypeService();
  List<Archetype> _archetypes = [];

  List<Archetype> get archetypes => _archetypes;

  Future<void> fetchArchetypes() async {
    _archetypes = await archetypeService.fetchArchetypes();
    notifyListeners();
  }
}
