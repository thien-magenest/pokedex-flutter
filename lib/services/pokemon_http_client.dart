import 'package:dio/dio.dart';
import 'package:pokemon/commons/types/model.dart';

class ServicePagination {
  int offset;
  int limit;

  ServicePagination({required this.offset, this.limit = 20});

  JsonMap toMap() => {'offset': offset, 'limit': limit};
}

class PokemonHttpClient with DioMixin implements Dio {
  PokemonHttpClient() {
    options = BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );

    // interceptors.add(LogInterceptor(responseBody: true));

    httpClientAdapter = HttpClientAdapter();
  }
}
