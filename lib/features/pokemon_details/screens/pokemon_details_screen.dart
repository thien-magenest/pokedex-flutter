import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/common/bloc/pokemon_bloc.dart';
import 'package:pokemon/common/theme/colors.dart';
import 'package:pokemon/features/pokemon_details/widgets/details_body.dart';
import 'package:pokemon/features/pokemon_details/widgets/details_header.dart';
import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final String name;

  const PokemonDetailsScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        PokemonDetailsResponseModel? pokemon = state.pokemons.firstWhere(
          (it) => it.name == name,
          orElse: () => const PokemonDetailsResponseModel(),
        );

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Scrollbar(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  color: PokemonColors.fromName(pokemon.color ?? 'white')
                      .withOpacity(0.65),
                ),
                DetailsBody(pokemon: pokemon),
                DetailsHeader(pokemon: pokemon),
              ],
            ),
          ),
        );
      },
    );
  }
}
