import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/providers/archetype_provider.dart';
import 'src/providers/monster_provider.dart';
import 'src/screens/archetype_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArchetypeProvider()),
        ChangeNotifierProvider(create: (_) => MonsterProvider()),
      ],
      child: MaterialApp(
        title: 'Yu-Gi-Oh! Archetypes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Llamamos a fetchArchetypes al iniciar la app
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ArchetypeProvider>(context, listen: false).fetchArchetypes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yu-Gi-Oh! Archetypes'),
      ),
      body: Consumer<ArchetypeProvider>(
        builder: (context, archetypeProvider, child) {
          if (archetypeProvider.archetypes.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ArchetypeListScreen();
          }
        },
      ),
    );
  }
}
