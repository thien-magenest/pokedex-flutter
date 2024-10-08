part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, success, failure }

final class PokemonState extends Equatable {
  final PokemonStatus status;
  final List<PokemonDetailsResponseModel> pokemons;
  final bool hasReachedMax;
  final dynamic error;

  const PokemonState(
      {this.status = PokemonStatus.initial,
      this.pokemons = const <PokemonDetailsResponseModel>[],
      this.hasReachedMax = false,
      this.error});

  PokemonState copyWith({
    PokemonStatus? status,
    List<PokemonDetailsResponseModel>? pokemons,
    bool? hasReachedMax,
    dynamic error,
  }) =>
      PokemonState(
        status: status ?? this.status,
        pokemons: pokemons ?? this.pokemons,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [status, pokemons, hasReachedMax, error];
}
