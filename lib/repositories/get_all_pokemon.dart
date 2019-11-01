import 'package:artemis/artemis.dart';
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
