import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';

class DetailsBody extends StatelessWidget {
  final PokemonDetailsResponseModel pokemon;

  const DetailsBody({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.4),
      padding: const EdgeInsets.only(
        top: 48,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      height: screenHeight * 0.6,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: const SizedBox(),
    );
  }
}
