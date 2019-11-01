import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/widgets/listing.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String filter = '';

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<PokemonBloc>(context).selectedPokemonImage;
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
        leading: image == null ? null : Image.network(image),
      ),
      body: Listing(filter: filter),
    );
  }
}
