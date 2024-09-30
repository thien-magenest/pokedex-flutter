part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PokemonFetched extends PokemonEvent {}
