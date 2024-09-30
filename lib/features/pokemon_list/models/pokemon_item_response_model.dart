import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/commons/types/model.dart';

part 'pokemon_item_response_model.g.dart';

@JsonSerializable()
class PokemonItemResponseModel {
  final String? name;
  final String? url;

  PokemonItemResponseModel({this.name, this.url});

  factory PokemonItemResponseModel.fromJson(JsonMap json) =>
      _$PokemonItemResponseModelFromJson(json);

  JsonMap toJson() => _$PokemonItemResponseModelToJson(this);
}
