import 'package:flutter/material.dart';
import 'package:pokedex/queries/all_pokemons_query.dart';
import 'package:pokedex/widgets/listing.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
    this.getAllPokemons,
  }) : super(key: key);

  final String title;
  Future<List<Pokemon>> Function() getAllPokemons;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String filter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (t) {
            setState(() {
              filter = t;
            });
          },
          decoration: InputDecoration(
            suffix: Icon(Icons.search),
          ),
        ),
      ),
      body: Listing(
        filter: filter,
        getAllPokemons: widget.getAllPokemons,
      ),
    );
  }
}
