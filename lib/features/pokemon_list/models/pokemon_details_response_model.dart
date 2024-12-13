import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/common/types/model.dart';

part 'pokemon_details_response_model.freezed.dart';
part 'pokemon_details_response_model.g.dart';

@freezed
class PokemonDetailsResponseModel with _$PokemonDetailsResponseModel {
  const factory PokemonDetailsResponseModel({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<Ability>? abilities,
    List<CommonItem>? forms,
    String? image,
    List<Stat>? stats,
    List<Type>? types,
    String? color,
    String? cry,
    @JsonKey(name: 'gender_rate') int? genderRate,
    @JsonKey(name: 'egg_groups') List<CommonItem>? eggGroups,
  }) = _PokemonDetailsResponseModel;

  factory PokemonDetailsResponseModel.fromJson(JsonMap json) =>
      _$PokemonDetailsResponseModelFromJson(json
        ..['image'] = json['sprites']['other']['home']['front_shiny']
        ..['cry'] = json['cries']['latest']);
}

@freezed
class CommonItem with _$CommonItem {
  const factory CommonItem({String? name, String? url}) = _CommonItem;

  factory CommonItem.fromJson(JsonMap json) => _$CommonItemFromJson(json);
}

@freezed
class Ability with _$Ability {
  const factory Ability({String? name, String? url}) = _Ability;

  factory Ability.fromJson(JsonMap json) => _$AbilityFromJson(json
    ..['name'] = json['ability']['name']
    ..['url'] = json['ability']['url']);
}

@freezed
class Stat with _$Stat {
  const factory Stat({
    @JsonKey(name: 'base_stat') int? baseStat,
    int? effort,
    String? name,
    String? url,
  }) = _Stat;

  factory Stat.fromJson(JsonMap json) => _$StatFromJson(json
    ..['name'] = json['stat']['name']
    ..['url'] = json['stat']['url']);
}

@freezed
class Type with _$Type {
  const factory Type({String? name, String? url}) = _Type;

  factory Type.fromJson(JsonMap json) => _$TypeFromJson(json
    ..['name'] = json['type']['name']
    ..['url'] = json['type']['url']);
}
