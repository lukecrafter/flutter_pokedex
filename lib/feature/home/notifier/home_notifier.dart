import 'package:flutter_pokedex/feature/home/model/pokemon_list_response_result.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/home/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<List<PokemonResponse>> {
  HomeRepository homeRepositoryProvider;

  HomeNotifier({
    required this.homeRepositoryProvider,
  }) : super(<PokemonResponse>[]);

  Future<List<PokemonResponse>> fetchPokemon({
    String? limit,
    String? offset,
  }) async {
    final List<PokemonListResponseResult>? pokemonList =
        await homeRepositoryProvider.getPokemonList(
      limit: limit,
      offset: offset,
    );

    if (pokemonList == null) return [];

    final List<PokemonResponse?> result = await Future.wait(
      pokemonList.map((PokemonListResponseResult pokemon) async {
        if (pokemon.url == null) return null;
        return await homeRepositoryProvider.getPokemonByUrl(url: pokemon.url!);
      }),
    );
    final List<PokemonResponse> newPokemonList = [];
    newPokemonList.addAll(result.whereType<PokemonResponse>());
    addPokemons(newPokemonList);
    return newPokemonList;
  }

  void addPokemons(List<PokemonResponse> pokemon) {
    state = [...state, ...pokemon];
  }
}
