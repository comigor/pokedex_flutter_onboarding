import 'package:artemis/artemis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/queries/single_pokemon_query.dart';

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
  Widget build(_) {
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
                  child: Image.network(snapshot.data.image),
                  tag: snapshot.data.id,
                ),
                Text(
                  snapshot.data.types.toString(),
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(
                  height: 256,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: (snapshot.data.evolutions ?? []).map((p) {
                      return InkWell(
                        child: Hero(
                          child: Image.network(p.image),
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
                child: Image.network(info.image),
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
