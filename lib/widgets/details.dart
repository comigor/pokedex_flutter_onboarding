import 'package:artemis/artemis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final String id;

  Details(this.id);

  @override
  Widget build(_) {
    return FutureBuilder<Pokemon>(
      future: getSinglePokemon(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Column(
              children: [
                Text(
                  '${snapshot.data.number} - ${snapshot.data.name}',
                  style: TextStyle(fontSize: 48),
                ),
                Image.network(snapshot.data.image),
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
                        child: Image.network(p.image),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/single', arguments: p.id);
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
          child: CupertinoActivityIndicator(
            radius: 50,
          ),
        );
      },
    );
  }
}
