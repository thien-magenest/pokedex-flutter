part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, success, failure }

final class PokemonState extends Equatable {
  final PokemonStatus status;
  final List<PokemonDetailsResponseModel> pokemons;
  final bool hasReachedMax;

  const PokemonState({
    this.status = PokemonStatus.initial,
    this.pokemons = const <PokemonDetailsResponseModel>[],
    this.hasReachedMax = false,
  });

  PokemonState copyWith({
    PokemonStatus? status,
    List<PokemonDetailsResponseModel>? pokemons,
    bool? hasReachedMax,
  }) =>
      PokemonState(
        status: status ?? this.status,
        pokemons: pokemons ?? this.pokemons,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object?> get props => [status, pokemons, hasReachedMax];
}
