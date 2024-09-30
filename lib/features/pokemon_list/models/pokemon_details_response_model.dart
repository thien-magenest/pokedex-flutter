import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../commons/types/model.dart';

part 'pokemon_details_response_model.g.dart';

@JsonSerializable()
final class PokemonDetailsResponseModel extends Equatable {
  final int? id;
  final String? name;
  final int? height;
  final int? weight;
  final List<CommonItem>? abilities;
  final List<CommonItem>? forms;
  final String? image;
  final List<Stat>? stats;
  final List<Type>? types;
  final String? color;

  const PokemonDetailsResponseModel({
    this.id,
    this.name,
    this.height,
    this.weight,
    this.abilities,
    this.forms,
    this.image,
    this.stats,
    this.types,
    this.color,
  });

  factory PokemonDetailsResponseModel.fromJson(JsonMap json) {
    json['image'] = json['sprites']['other']['home']['front_shiny'];
    return _$PokemonDetailsResponseModelFromJson(json);
  }

  JsonMap toJson() => _$PokemonDetailsResponseModelToJson(this);

  @override
  List<Object?> get props =>
      [id, name, height, weight, abilities, forms, image, stats, types, color];
}

@JsonSerializable()
final class CommonItem extends Equatable {
  final String? name;
  final String? url;

  const CommonItem({this.name, this.url});

  factory CommonItem.fromJson(JsonMap json) => _$CommonItemFromJson(json);

  JsonMap toJson() => _$CommonItemToJson(this);

  @override
  List<Object?> get props => [name, url];
}

@JsonSerializable()
final class Stat extends Equatable {
  @JsonKey(name: 'base_stat')
  final int? baseStat;
  final int? effort;
  final String? name;
  final String? url;

  const Stat({this.baseStat, this.effort, this.name, this.url});

  factory Stat.fromJson(JsonMap json) {
    json['name'] = json['stat']['name'];
    json['url'] = json['stat']['url'];
    return _$StatFromJson(json);
  }

  JsonMap toJson() => _$StatToJson(this);

  @override
  List<Object?> get props => [baseStat, effort, name, url];
}

@JsonSerializable()
class Type extends Equatable {
  final String? name;
  final String? url;

  const Type({this.name, this.url});

  factory Type.fromJson(JsonMap json) {
    json['name'] = json['type']['name'];
    json['url'] = json['type']['url'];
    return _$TypeFromJson(json);
  }

  JsonMap toJson() => _$TypeToJson(this);

  @override
  List<Object?> get props => [name, url];
}
