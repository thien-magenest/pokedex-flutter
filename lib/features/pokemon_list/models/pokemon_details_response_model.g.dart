// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsResponseModel _$PokemonDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsResponseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => CommonItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      forms: (json['forms'] as List<dynamic>?)
          ?.map((e) => CommonItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String?,
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] as String?,
    );

Map<String, dynamic> _$PokemonDetailsResponseModelToJson(
        PokemonDetailsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'forms': instance.forms,
      'image': instance.image,
      'stats': instance.stats,
      'types': instance.types,
      'color': instance.color,
    };

CommonItem _$CommonItemFromJson(Map<String, dynamic> json) => CommonItem(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CommonItemToJson(CommonItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      baseStat: (json['base_stat'] as num?)?.toInt(),
      effort: (json['effort'] as num?)?.toInt(),
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'name': instance.name,
      'url': instance.url,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
