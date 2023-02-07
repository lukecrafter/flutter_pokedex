import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/pokemon/service/pokemon_service.dart';

class PokemonRepository {
  final PokemonService _pokemonService;

  PokemonRepository(this._pokemonService);

  Future<PokemonResponse> getPokemonById({required String id}) async {
    try {
      return await _pokemonService.getPokemonById(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
