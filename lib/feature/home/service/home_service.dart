import 'package:dio/dio.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_list_response.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_list_response_result.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';

abstract class HomeServices {
  final Dio _dio;

  HomeServices(this._dio);

  Future<List<PokemonListResponseResult>?> getPokemonList();
  Future<PokemonResponse?> getPokemonByUrl({required String url});
}

class HomeServicesImpl extends HomeServices {
  HomeServicesImpl(Dio dio) : super(dio);

  @override
  Future<List<PokemonListResponseResult>?> getPokemonList({
    String? limit = '0',
    String? offset = '0',
  }) async {
    try {
      final String path = '/pokemon?limit=$limit&offset=$offset';
      final Response response = await _dio.get(path);
      final PokemonListResponse result =
          PokemonListResponse.fromJson(response.data);
      return result.results;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<PokemonResponse?> getPokemonByUrl({required String url}) async {
    try {
      final Response response = await _dio.get(url);
      final PokemonResponse result = PokemonResponse.fromJson(response.data);
      return result;
    } catch (e) {
      return null;
    }
  }
}
