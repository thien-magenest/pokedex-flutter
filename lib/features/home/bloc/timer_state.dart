part of 'timer_bloc.dart';

enum TimerStatus { initial, inProgress, pause, complete }

@Freezed(fromJson: false, toJson: false)
class TimerState with _$TimerState {
  const factory TimerState(TimerStatus status, [@Default(0) int duration]) =
      _TimerState;
}
