part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, success, failure }

@Freezed(fromJson: false, toJson: false)
class PokemonState with _$PokemonState {
  const factory PokemonState({
    @Default(PokemonStatus.initial) PokemonStatus status,
    @Default(<PokemonDetailsResponseModel>[])
    List<PokemonDetailsResponseModel> pokemons,
    @Default(false) bool hasReachedMax,
    dynamic error,
  }) = _PokemonState;
}
