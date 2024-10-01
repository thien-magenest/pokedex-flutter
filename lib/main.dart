import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/common/bloc/pokemon_bloc.dart';
import 'package:pokemon/features/pokemon_details/screens/pokemon_details_screen.dart';
import 'package:pokemon/features/pokemon_list/screens/pokemons_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonBloc(),
      child: MaterialApp.router(
        title: 'Pokemon',
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(routes: [
          GoRoute(
              path: '/', builder: (context, state) => const PokemonsScreen()),
          GoRoute(
            path: '/pokemon/:name',
            builder: (context, state) =>
                PokemonDetailsScreen(name: state.pathParameters['name']!),
          ),
        ]),
      ),
    );
  }
}
