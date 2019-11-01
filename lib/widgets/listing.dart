import 'package:artemis/artemis.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/queries/all_pokemons_query.dart';

Future<List<Pokemon>> getAllPokemons() async {
  final artemisClient = ArtemisClient('https://graphql-pokemon.now.sh');
  final query = AllPokemonsQuery();

  final response = await artemisClient.execute(query);

  if (!response.hasErrors) {
    return response.data.pokemons;
  }
  return [];
}

class Listing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListingState();
  }
}

class _ListingState extends State<Listing> {
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    final response = await getAllPokemons();
    setState(() {
      pokemons = response;
    });
  }

  @override
  Widget build(_) {
    return ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (_, index) {
        return ListTile(
          leading: Image.network(pokemons[index].image),
          title: Text('${pokemons[index].number} - ${pokemons[index].name}'),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/single',
              arguments: pokemons[index].id,
            );
          },
        );
      },
    );
  }
}
