import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/features/home/bloc/timer_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => TimerBloc(60),
        child: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final timerBloc = context.read<TimerBloc>();
    final state = context.select((TimerBloc bloc) => bloc.state);
    final duration = state.duration;

    final minutesStr = (duration ~/ 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('$minutesStr:$secondsStr'),
          if (state.status != TimerStatus.complete)
            ElevatedButton(
              onPressed: () {
                switch (state.status) {
                  case TimerStatus.initial:
                    timerBloc.add(const TimerStarted());
                  case TimerStatus.inProgress:
                    timerBloc.add(const TimerPaused());
                  case TimerStatus.pause:
                    timerBloc.add(const TimerResumed());
                  case TimerStatus.complete:
                    timerBloc.add(const TimerReset());
                }
              },
              child: Text(switch (state.status) {
                TimerStatus.initial => 'Start',
                TimerStatus.inProgress => 'Pause',
                TimerStatus.pause => 'Resume',
                TimerStatus.complete => 'Reset'
              }),
            ),
          ElevatedButton(
            onPressed: () {
              timerBloc.add(const TimerReset());
            },
            child: const Text('Reset'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/pokemons');
            },
            child: const Text('Go To List Screen'),
          ),
        ],
      ),
    );
  }
}
