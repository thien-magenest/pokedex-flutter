part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object?> get props => [];
}

final class _TimerTicked extends TimerEvent {
  final int duration;

  const _TimerTicked(this.duration);

  @override
  List<Object?> get props => [duration];
}

final class TimerStarted extends TimerEvent {
  const TimerStarted();
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

final class TimerReset extends TimerEvent {
  const TimerReset();
}
