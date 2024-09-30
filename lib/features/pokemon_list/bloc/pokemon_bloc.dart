import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../services/pokemon_http_client.dart';
import '../services/pokemon_services.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
    on<PokemonFetched>(
      _onPokemonFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onPokemonFetched(
    PokemonFetched event,
    Emitter<PokemonState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      final data = await PokemonService.fetchPokemons(
        ServicePagination(offset: state.pokemons.length ?? 0),
      );

      if (data == null) return;

      emit(
        data.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: PokemonStatus.success,
                pokemons: List.of(state.pokemons)..addAll(data),
                hasReachedMax: false,
              ),
      );
    } catch (_) {
      emit(state.copyWith(status: PokemonStatus.failure));
    }
  }
}
