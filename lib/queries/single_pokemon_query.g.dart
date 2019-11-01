// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_pokemon_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SinglePokemon _$SinglePokemonFromJson(Map<String, dynamic> json) {
  return SinglePokemon()
    ..pokemon = json['pokemon'] == null
        ? null
        : Pokemon.fromJson(json['pokemon'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SinglePokemonToJson(SinglePokemon instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon?.toJson(),
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon()
    ..id = json['id'] as String
    ..number = json['number'] as String
    ..name = json['name'] as String
    ..image = json['image'] as String
    ..types = (json['types'] as List)?.map((e) => e as String)?.toList()
    ..evolutions = (json['evolutions'] as List)
        ?.map((e) =>
            e == null ? null : Pokemon.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'image': instance.image,
      'types': instance.types,
      'evolutions': instance.evolutions?.map((e) => e?.toJson())?.toList(),
    };

SinglePokemonArguments _$SinglePokemonArgumentsFromJson(
    Map<String, dynamic> json) {
  return SinglePokemonArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$SinglePokemonArgumentsToJson(
        SinglePokemonArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
