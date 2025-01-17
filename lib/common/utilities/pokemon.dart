import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';

final class PokemonUtils {
  final PokemonDetailsResponseModel pokemon;

  const PokemonUtils(this.pokemon);

  // hectogram -> kilogram
  double getWeight() => pokemon.weight != null ? (pokemon.weight! / 10) : 0;

  // hectometer -> meter
  double getHeight() => pokemon.height != null ? (pokemon.height! / 10) : 0;

  ({num male, num female}) getGenderStatistical() {
    if (pokemon.genderRate == null) return (male: 0, female: 0);
    if (pokemon.genderRate == -1) return (male: 100, female: 0);

    final female = (pokemon.genderRate! / 8) * 100;
    final male = 100 - female;

    return (male: male, female: female);
  }

  String getStatisticalName(String statName) => switch (statName) {
        'hp' => 'HP',
        'attack' => 'Attack',
        'defense' => 'Defense',
        'special-attack' => 'Special Attack',
        'special-defense' => 'Special Defense',
        'speed' => 'Speed',
        'accuracy' => 'Accuracy',
        'evasion' => 'Evasion',
        _ => '',
      };
}
