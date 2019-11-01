import 'package:flutter/widgets.dart';

class PokemonBloc extends ChangeNotifier {
  String selectedPokemonImage;

  void selectPokemon(String image) {
    selectedPokemonImage = image;
    notifyListeners();
  }
}
