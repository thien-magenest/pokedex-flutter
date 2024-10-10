import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/common/utilities/text.dart';
import 'package:pokemon/features/pokemon_details/widgets/details_body_section.dart';
import 'package:pokemon/features/pokemon_details/widgets/details_information_item.dart';
import 'package:pokemon/features/pokemon_details/widgets/details_stat_item.dart';
import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';

class DetailsBody extends StatelessWidget {
  final PokemonDetailsResponseModel pokemon;

  const DetailsBody({super.key, required this.pokemon});

  final TextStyle _defaultItemValueTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final genderStatistical = pokemon.getGenderStatistical();
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    // TODO: add cry sound button to the header widget
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsBodySection(
              title: 'About',
              children: [
                DetailsInformationItem(
                  label: 'Height',
                  child: Text(
                    '${pokemon.getHeight()} m',
                    style: _defaultItemValueTextStyle,
                  ),
                ),
                const SizedBox(height: 4),
                DetailsInformationItem(
                  label: 'Weight',
                  child: Text(
                    '${pokemon.getWeight()} kg',
                    style: _defaultItemValueTextStyle,
                  ),
                ),
                const SizedBox(height: 4),
                DetailsInformationItem(
                  label: 'Abilities',
                  child: Text(
                    '${pokemon.abilities?.fold(
                      '',
                      (accumulator, ability) =>
                          accumulator +
                          (accumulator.isEmpty ? '' : ', ') +
                          TextUtils.capitalize(ability.name),
                    )}',
                    style: _defaultItemValueTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DetailsBodySection(
              title: 'Breeding',
              children: [
                DetailsInformationItem(
                  label: 'Gender',
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.male, color: Colors.blue),
                          Text(
                            '${genderStatistical.male}%',
                            style: _defaultItemValueTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: [
                          const Icon(Icons.female, color: Colors.pink),
                          Text(
                            '${genderStatistical.female}%',
                            style: _defaultItemValueTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                DetailsInformationItem(
                  label: 'Egg groups',
                  child: Text(
                    '${pokemon.eggGroups?.fold(
                      '',
                      (accumulator, egg) =>
                          accumulator +
                          (accumulator.isEmpty ? '' : ', ') +
                          TextUtils.capitalize(egg.name),
                    )}',
                    style: _defaultItemValueTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (pokemon.stats != null && pokemon.stats!.isNotEmpty)
              DetailsBodySection(
                title: 'Base Stats',
                children: pokemon.stats!
                    .mapIndexed(
                      (i, stat) => Column(
                        children: [
                          if (i != 0) const SizedBox(height: 4),
                          DetailsStatItem(
                            label: stat.getName(),
                            stat: stat.baseStat ?? 0,
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
