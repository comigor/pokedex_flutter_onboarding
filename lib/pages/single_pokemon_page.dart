import 'package:flutter/material.dart';
import 'package:pokedex/widgets/details.dart';

class SinglePokemonPage extends StatelessWidget {
  final String id;

  SinglePokemonPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Details(id),
    );
  }
}
