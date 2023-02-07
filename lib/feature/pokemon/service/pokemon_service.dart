import 'package:dio/dio.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';

abstract class PokemonService {
  final Dio _dio;

  PokemonService(this._dio);

  Future<PokemonResponse> getPokemonById({required String id});
}

class PokemonServiceImpl extends PokemonService {
  PokemonServiceImpl(Dio dio) : super(dio);

  @override
  Future<PokemonResponse> getPokemonById({required String id}) async {
    try {
      final Response response = await _dio.get('/pokemon/$id');
      final PokemonResponse result = PokemonResponse.fromJson(response.data);
      return result;
    } catch (e) {
      throw Exception();
    }
  }
}
