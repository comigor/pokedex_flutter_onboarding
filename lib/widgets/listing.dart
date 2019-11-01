import 'package:artemis/artemis.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/queries/all_pokemons_query.dart';
import 'package:pokedex/widgets/toggled_image.dart';
import 'package:provider/provider.dart';

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
    final bloc = Provider.of<PokemonBloc>(context);

    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (_, index) {
        final title = bloc.isCatch(filtered[index].id)
            ? Text('${filtered[index].number} - ${filtered[index].name}')
            : Text(
                '${filtered[index].number} - ${filtered[index].name}',
                style: TextStyle(color: Colors.grey),
              );

        return ListTile(
          leading: Hero(
            child: ToggledImage(
              url: filtered[index].image,
              colorized: bloc.isCatch(filtered[index].id),
            ),
            tag: '${filtered[index].id}',
          ),
          title: title,
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
