import 'package:flutter/material.dart';
import 'package:pokemon/common/utilities/text.dart';
import 'package:pokemon/common/widgets/animated_network_image.dart';
import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';

class DetailsHeader extends StatelessWidget {
  final PokemonDetailsResponseModel pokemon;

  const DetailsHeader({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final name = TextUtils.capitalize(pokemon.name);

    return SafeArea(
      top: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: pokemon.types!.map((type) {
                        final String typeName = TextUtils.capitalize(type.name);
                        final bool isFirstItem =
                            pokemon.types!.first.name == type.name;

                        return Container(
                          margin: isFirstItem
                              ? null
                              : const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(
                              255,
                              255,
                              255,
                              0.25,
                            ),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Text(
                            typeName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                if (pokemon.id != null)
                  Text(
                    '#${pokemon.id}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
            if (pokemon.name != null && pokemon.image != null)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedNetworkImage(
                    tag: '${pokemon.name}_pokemon_image',
                    image: pokemon.image!,
                    width: screenWidth / 2,
                    height: screenWidth / 2,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
