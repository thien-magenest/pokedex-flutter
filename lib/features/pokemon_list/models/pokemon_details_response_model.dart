import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/types/model.dart';

part 'pokemon_details_response_model.g.dart';

@JsonSerializable()
final class PokemonDetailsResponseModel extends Equatable {
  final int? id;
  final String? name;
  final int? height;
  final int? weight;
  final List<Ability>? abilities;
  final List<CommonItem>? forms;
  final String? image;
  final List<Stat>? stats;
  final List<Type>? types;
  final String? color;
  final String? cry;
  @JsonKey(name: 'gender_rate')
  final int? genderRate;
  @JsonKey(name: 'egg_groups')
  final List<CommonItem>? eggGroups;

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
    this.cry,
    this.genderRate,
    this.eggGroups,
  });

  // hectogram -> kilogram
  double getWeight() => weight != null ? (weight! / 10) : 0;

  // hectometer -> meter
  double getHeight() => height != null ? (height! / 10) : 0;

  ({num male, num female}) getGenderStatistical() {
    if (genderRate == null) return (male: 0, female: 0);
    if (genderRate == -1) return (male: 100, female: 0);

    final female = (genderRate! / 8) * 100;
    final male = 100 - female;

    return (male: male, female: female);
  }

  factory PokemonDetailsResponseModel.fromJson(JsonMap json) {
    json['image'] = json['sprites']['other']['home']['front_shiny'];
    json['cry'] = json['cries']['latest'];
    return _$PokemonDetailsResponseModelFromJson(json);
  }

  JsonMap toJson() => _$PokemonDetailsResponseModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        height,
        weight,
        abilities,
        forms,
        image,
        stats,
        types,
        color,
        cry,
        genderRate,
        eggGroups
      ];
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
class Ability extends Equatable {
  final String? name;
  final String? url;

  const Ability({this.name, this.url});

  factory Ability.fromJson(JsonMap json) {
    json['name'] = json['ability']['name'];
    json['url'] = json['ability']['url'];
    return _$AbilityFromJson(json);
  }

  JsonMap toJson() => _$AbilityToJson(this);

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

  String getName() => switch (name) {
        'hp' => 'HP',
        'attack' => 'Attack',
        'defense' => 'Defense',
        'special-attack' => 'Special Attack',
        'special-defense' => 'Special Defense',
        'speed' => 'Speed',
        'accuracy' => 'Accuracy',
        'evasion' => 'Evasion',
        _ => '',
      };

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
