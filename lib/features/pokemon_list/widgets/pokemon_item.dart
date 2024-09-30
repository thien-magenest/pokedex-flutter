import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/commons/theme/colors.dart';
import 'package:pokemon/commons/utilities/text.dart';
import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';

class PokemonItem extends StatelessWidget {
  final PokemonDetailsResponseModel? item;

  const PokemonItem({super.key, required this.item});

  void _goToDetailScreen(BuildContext context) {
    context.push('/pokemon/${item?.name}');
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double imageSize = screenWidth / 6;
    final String backgroundColorName = item?.color ?? 'white';
    final String image = item?.image ?? '';
    final String pokemonName = TextUtils.capitalize(item?.name);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _goToDetailScreen(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              PokemonColors.fromName(backgroundColorName).withOpacity(0.65),
              PokemonColors.fromName(backgroundColorName).withOpacity(0.75),
              PokemonColors.fromName(backgroundColorName)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemonName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: item?.types != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: item!.types!.map((type) {
                        final String typeName = TextUtils.capitalize(type.name);
                        final bool isFirstItem =
                            item!.types!.first.name == type.name;

                        return Container(
                          margin: isFirstItem
                              ? null
                              : const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.25),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 0,
                          ),
                          child: Text(
                            typeName,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Image.network(
                    image,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.fill,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
