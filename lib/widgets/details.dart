import 'package:artemis/artemis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/queries/single_pokemon_query.dart';
import 'package:pokedex/widgets/toggled_image.dart';
import 'package:provider/provider.dart';

Future<Pokemon> getSinglePokemon(String id) async {
  final artemisClient = ArtemisClient('https://graphql-pokemon.now.sh');
  final query = SinglePokemonQuery(
    variables: SinglePokemonArguments(id: id),
  );

  final response = await artemisClient.execute(query);

  if (!response.hasErrors) {
    return response.data.pokemon;
  }
  return null;
}

class Details extends StatelessWidget {
  final NavigationInfo info;

  Details(this.info);

  @override
  Widget build(context) {
    final bloc = Provider.of<PokemonBloc>(context);

    return FutureBuilder<Pokemon>(
      future: getSinglePokemon(info.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Column(
              children: [
                Text(
                  '${snapshot.data.number} - ${snapshot.data.name}',
                  style: TextStyle(fontSize: 48),
                ),
                Hero(
                  child: ToggledImage(
                    url: snapshot.data.image,
                    colorized: bloc.isCatch(snapshot.data.id),
                  ),
                  tag: snapshot.data.id,
                ),
                Text(
                  snapshot.data.types.toString(),
                  style: TextStyle(fontSize: 48),
                ),
                RaisedButton(
                  child: Text(
                      bloc.isCatch(snapshot.data.id) ? 'RELEASE' : 'CATCH'),
                  onPressed: () {
                    if (bloc.isCatch(snapshot.data.id)) {
                      bloc.releasePokemon(snapshot.data.id);
                    } else {
                      bloc.catchPokemon(snapshot.data.id);
                    }
                  },
                ),
                SizedBox(
                  height: 256,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: (snapshot.data.evolutions ?? []).map((p) {
                      return InkWell(
                        child: Hero(
                          child: ToggledImage(
                            url: p.image,
                            colorized: bloc.isCatch(p.id),
                          ),
                          tag: p.id,
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('/single',
                              arguments: NavigationInfo(p.id, p.image));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }

        return Center(
          child: Column(
            children: [
              CupertinoActivityIndicator(radius: 32),
              Hero(
                child: ToggledImage(
                  url: info.image,
                  colorized: bloc.isCatch(info.id),
                ),
                tag: '${info.id}',
              ),
              CupertinoActivityIndicator(radius: 48),
            ],
          ),
        );
      },
    );
  }
}
