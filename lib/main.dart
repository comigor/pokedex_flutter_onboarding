import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page.dart';
import 'pages/single_pokemon_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
        '/': (_) => MyHomePage(title: 'Pokedéx'),
        '/single': (context) {
          final id = ModalRoute.of(context).settings.arguments.toString();
          return SinglePokemonPage(id);
        },
      },
    );
  }
}
