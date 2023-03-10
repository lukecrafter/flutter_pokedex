import 'package:flutter_pokedex/feature/home/model/pokemon_list_response_result.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/home/service/home_service.dart';

class HomeRepository {
  final HomeServicesImpl _homeRepo;

  HomeRepository(this._homeRepo);

  Future<List<PokemonListResponseResult>?> getPokemonList({
    String? limit = '0',
    String? offset = '0',
  }) async {
    try {
      return await _homeRepo.getPokemonList(
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      return null;
    }
  }

  Future<PokemonResponse?> getPokemonByUrl({required String url}) async {
    try {
      return await _homeRepo.getPokemonByUrl(url: url);
    } catch (e) {
      return null;
    }
  }
}
