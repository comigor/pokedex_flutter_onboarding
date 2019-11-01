import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/queries/all_pokemons_query.dart';
import 'package:provider/provider.dart';

Pokemon generatePokemon(String id) {
  return Pokemon()
    ..id = id
    ..name = id
    ..image = null
    ..number = id;
}

void main() {
  testWidgets('no item should appear when theres no responses',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      Burrito(
        child: MyHomePage(
          title: '',
          getAllPokemons: () async => [],
        ),
      ),
    );

    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('items should appear on a list', (WidgetTester tester) async {
    await tester.pumpWidget(
      Burrito(
        child: MyHomePage(
          title: '',
          getAllPokemons: () async => [
            generatePokemon('001'),
          ],
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('001 - 001'), findsOneWidget);
  });

  testWidgets('search should work', (WidgetTester tester) async {
    await tester.pumpWidget(
      Burrito(
        child: MyHomePage(
          title: '',
          getAllPokemons: () async => [
            generatePokemon('pikachu'),
            generatePokemon('bulbasaur'),
            generatePokemon('charmander'),
            generatePokemon('squirtle'),
          ],
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsNWidgets(4));

    await expectLater(find.byType(MaterialApp), matchesGoldenFile('first.png'));

    await tester.enterText(find.byType(TextField), 'pika');

    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text('pikachu - pikachu'), findsOneWidget);

    await expectLater(
        find.byType(MaterialApp), matchesGoldenFile('second.png'));
  });
}

class Burrito extends StatelessWidget {
  final Widget child;

  const Burrito({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonBloc>.value(
      value: PokemonBloc(),
      child: MaterialApp(
        home: child,
      ),
    );
  }
}
