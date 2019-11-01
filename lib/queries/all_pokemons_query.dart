// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'all_pokemons_query.g.dart';

@JsonSerializable(explicitToJson: true)
class AllPokemons with EquatableMixin {
  AllPokemons();

  factory AllPokemons.fromJson(Map<String, dynamic> json) =>
      _$AllPokemonsFromJson(json);

  List<Pokemon> pokemons;

  @override
  List<Object> get props => [pokemons];
  Map<String, dynamic> toJson() => _$AllPokemonsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Pokemon with EquatableMixin {
  Pokemon();

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  String id;

  String number;

  String name;

  String image;

  @override
  List<Object> get props => [id, number, name, image];
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

class AllPokemonsQuery extends GraphQLQuery<AllPokemons, JsonSerializable> {
  AllPokemonsQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'allPokemons'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'pokemons'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: IntValueNode(value: '150'))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'number'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'allPokemons';

  @override
  List<Object> get props => [document, operationName];
  @override
  AllPokemons parse(Map<String, dynamic> json) => AllPokemons.fromJson(json);
}
