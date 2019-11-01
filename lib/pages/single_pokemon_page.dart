import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/widgets/details.dart';

class SinglePokemonPage extends StatelessWidget {
  final NavigationInfo info;

  SinglePokemonPage(this.info);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Details(info),
    );
  }
}
