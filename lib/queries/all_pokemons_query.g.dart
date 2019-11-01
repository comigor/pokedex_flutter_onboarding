// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemons_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllPokemons _$AllPokemonsFromJson(Map<String, dynamic> json) {
  return AllPokemons()
    ..pokemons = (json['pokemons'] as List)
        ?.map((e) =>
            e == null ? null : Pokemon.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AllPokemonsToJson(AllPokemons instance) =>
    <String, dynamic>{
      'pokemons': instance.pokemons?.map((e) => e?.toJson())?.toList(),
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon()
    ..id = json['id'] as String
    ..number = json['number'] as String
    ..name = json['name'] as String
    ..image = json['image'] as String;
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'image': instance.image,
    };
