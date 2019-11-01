import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/repositories/get_all_pokemon.dart';
import 'package:provider/provider.dart';
import 'pages/single_pokemon_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonBloc>.value(
      value: PokemonBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        routes: {
          '/': (_) => MyHomePage(
                title: 'Pokedéx',
                getAllPokemons: getAllPokemons,
              ),
          '/single': (context) {
            final info =
                ModalRoute.of(context).settings.arguments as NavigationInfo;
            return SinglePokemonPage(info);
          },
        },
      ),
    );
  }
}
