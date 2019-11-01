import 'package:flutter/widgets.dart';

class PokemonBloc extends ChangeNotifier {
  Set<String> _catchPokemons = Set();

  void catchPokemon(String id) {
    _catchPokemons.add(id);
    notifyListeners();
  }

  void releasePokemon(String id) {
    _catchPokemons.remove(id);
    notifyListeners();
  }

  bool isCatch(String id) => _catchPokemons.contains(id);
}
