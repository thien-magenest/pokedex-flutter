import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final int _duration;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc(this._duration) : super(TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResume);
    on<TimerReset>(_onReset);
    on<_TimerTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerInProgress(_duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = Stream.periodic(
      const Duration(seconds: 1),
      (x) => _duration - x - 1,
    ).take(_duration).listen((duration) => add(_TimerTicked(duration)));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is! TimerInProgress) return;

    _tickerSubscription?.pause();
    emit(TimerPause(state.duration));
  }

  void _onResume(TimerResumed event, Emitter<TimerState> emit) {
    if (state is! TimerPause) return;

    _tickerSubscription?.resume();
    emit(TimerInProgress(state.duration));
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerInitial(_duration));
  }

  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerInProgress(event.duration)
          : const TimerComplete(),
    );
  }
}
