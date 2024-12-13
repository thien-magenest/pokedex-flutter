import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/common/types/model.dart';

part 'pokemon_item_response_model.freezed.dart';
part 'pokemon_item_response_model.g.dart';

@freezed
class PokemonItemResponseModel with _$PokemonItemResponseModel {
  const factory PokemonItemResponseModel({String? name, String? url}) =
      _PokemonItemResponseModel;

  factory PokemonItemResponseModel.fromJson(JsonMap json) =>
      _$PokemonItemResponseModelFromJson(json);
}
