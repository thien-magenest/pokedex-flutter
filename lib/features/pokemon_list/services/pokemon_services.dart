import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon/common/types/model.dart';
import 'package:pokemon/features/pokemon_list/models/pokemon_details_response_model.dart';
import 'package:pokemon/models/pagination_response_api_model.dart';
import 'package:pokemon/services/pokemon_http_client.dart';

import '../models/pokemon_item_response_model.dart';

class PokemonService {
  static final PokemonHttpClient _httpClient = PokemonHttpClient();

  static Future<List<Response<dynamic>>> _fetchPokemonDetails(int id) {
    return Future.wait([
      _httpClient.get('/pokemon-species/$id'),
      _httpClient.get('/pokemon/$id')
    ]);
  }

  static Future<List<PokemonDetailsResponseModel>?> fetchPokemons(
      ServicePagination pagination) async {
    final metaResponse =
        await _httpClient.get('/pokemon', queryParameters: pagination.toMap());

    final pokemonMetaList =
        await compute(_parsePokemonMetaList, metaResponse.data);

    if (pokemonMetaList.results!.isEmpty) return null;

    final pokemonResponses = await Future.wait(
      pokemonMetaList.results!.map(
        (item) {
          final urlSplit = item.url?.split('/');
          final id = urlSplit?.elementAt(urlSplit.length - 2);

          return _fetchPokemonDetails(int.parse(id ?? '1'));
        },
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
          item.last.data['gender_rate'] = item.first.data['gender_rate'];
          item.last.data['egg_groups'] = item.first.data['egg_groups'];
          return PokemonDetailsResponseModel.fromJson(item.last.data);
        },
      ).toList();
}
