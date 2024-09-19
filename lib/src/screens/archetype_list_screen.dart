import 'package:flutter/material.dart';
import '../providers/archetype_provider.dart';
import 'monster_detail_screen.dart';
import 'package:provider/provider.dart';
import '../models/archetype_model.dart';

class ArchetypeListScreen extends StatefulWidget {
  @override
  _ArchetypeListScreenState createState() => _ArchetypeListScreenState();
}

class _ArchetypeListScreenState extends State<ArchetypeListScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Archetype> _filteredArchetypes = [];

  @override
  void initState() {
    super.initState();
    // Obtener los arquetipos desde el Provider y asignar a la lista filtrada
    final archetypes = context.read<ArchetypeProvider>().archetypes;
    _filteredArchetypes = archetypes;
    // Escuchar los cambios en el campo de búsqueda
    _searchController.addListener(_filterArchetypes);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterArchetypes() {
    final archetypes = context.read<ArchetypeProvider>().archetypes;
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredArchetypes = archetypes
          .where((archetype) => archetype.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search archetypes...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredArchetypes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredArchetypes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MonsterDetailScreen(
                    archetypeName: _filteredArchetypes[index].name,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
