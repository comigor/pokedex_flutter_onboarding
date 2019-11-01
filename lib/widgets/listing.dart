import 'package:artemis/artemis.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon.dart';
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
  String filter;

  Listing({this.filter = ''});

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
    final filtered = pokemons.where((p) {
      return p.name.toLowerCase().contains(widget.filter.toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (_, index) {
        return ListTile(
          leading: Hero(
            child: Image.network(filtered[index].image),
            tag: '${filtered[index].id}',
          ),
          title: Text('${filtered[index].number} - ${filtered[index].name}'),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/single',
              arguments: NavigationInfo(
                filtered[index].id,
                filtered[index].image,
              ),
            );
          },
        );
      },
    );
  }
}
