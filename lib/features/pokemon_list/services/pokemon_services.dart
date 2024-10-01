import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon/common/types/model.dart';
import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';
import 'package:pokemon/models/pagination_response_api_model.dart';
import 'package:pokemon/services/pokemon_http_client.dart';

import '../models/pokemon_item_response_model.dart';

class PokemonService {
  static final PokemonHttpClient _httpClient = PokemonHttpClient();

  static Future<List<Response<dynamic>>> _fetchPokemonDetails(
      String pokemonName) async {
    return Future.wait([
      _httpClient.get('https://pokeapi.co/api/v2/pokemon-species/$pokemonName'),
      _httpClient.get('/pokemon/$pokemonName')
    ]);
  }

  static Future<List<PokemonDetailsResponseModel>?> fetchPokemons(
      ServicePagination pagination) async {
    final metaResponse =
        await _httpClient.get('/pokemon', queryParameters: pagination.toMap());

    final pokemonMetaList =
        await compute(_parsePokemonMetaList, metaResponse.data);

    if (pokemonMetaList.results != null && pokemonMetaList.results!.isEmpty) {
      return null;
    }

    final pokemonResponses = await Future.wait(
      pokemonMetaList.results!.map(
        (item) => _fetchPokemonDetails(item.name!),
      ),
    );

    if (pokemonResponses.isEmpty) return null;

    return compute(_parsePokemons, pokemonResponses);
  }

  static PaginationResponseApiModel<PokemonItemResponseModel>
      _parsePokemonMetaList(dynamic data) =>
          PaginationResponseApiModel<PokemonItemResponseModel>.fromJson(
            data,
            (json) => PokemonItemResponseModel.fromJson(json as JsonMap),
          );

  static List<PokemonDetailsResponseModel> _parsePokemons(
    List<List<Response<dynamic>>> responses,
  ) =>
      responses.map(
        (item) {
          item.last.data['color'] = item.first.data['color']['name'];
          return PokemonDetailsResponseModel.fromJson(item.last.data);
        },
      ).toList();
}
