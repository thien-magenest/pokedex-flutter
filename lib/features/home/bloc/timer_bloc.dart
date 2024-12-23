import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_bloc.freezed.dart';
part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final int _initialDuration;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc(int duration)
      : _initialDuration = duration,
        super(TimerState(TimerStatus.initial, duration)) {
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
    emit(TimerState(TimerStatus.inProgress, _initialDuration));
    _tickerSubscription?.cancel();
    _tickerSubscription = Stream.periodic(
      const Duration(seconds: 1),
      (x) => _initialDuration - x - 1,
    ).take(_initialDuration).listen((duration) => add(_TimerTicked(duration)));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state.status != TimerStatus.inProgress) return;

    _tickerSubscription?.pause();
    emit(TimerState(TimerStatus.pause, state.duration));
  }

  void _onResume(TimerResumed event, Emitter<TimerState> emit) {
    if (state.status != TimerStatus.pause) return;

    _tickerSubscription?.resume();
    emit(TimerState(TimerStatus.inProgress, state.duration));
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerState(TimerStatus.initial, _initialDuration));
  }

  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerState(TimerStatus.inProgress, event.duration)
          : const TimerState(TimerStatus.complete),
    );
  }
}
