import 'package:flutter_pokedex/feature/home/model/pokemon_list_response_result.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/home/repository/home_repository.dart';
import 'package:flutter_pokedex/service/local_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<List<PokemonResponse>> {
  HomeRepository homeRepositoryProvider;
  LocalStorageService storageService;

  HomeNotifier({
    required this.homeRepositoryProvider,
    required this.storageService,
  }) : super(<PokemonResponse>[]);

  Future<List<PokemonResponse>> fetchPokemon({
    required int limit,
    required int offset,
  }) async {
    int? pokemonExistedInListCount;

    if (state.isNotEmpty) {
      if (state.length >= offset + limit) {
        final List<PokemonResponse> list =
            state.getRange(offset, offset + limit).toList();
        return list;
      } else if (state.length > offset) {
        pokemonExistedInListCount = state.length - offset;
      }
    }

    List<PokemonListResponseResult>? pokemonList =
        await homeRepositoryProvider.getPokemonList(
      limit: '$limit',
      offset: '$offset',
    );

    if (pokemonList == null) return [];
    if (pokemonExistedInListCount != null) {
      pokemonList = pokemonList.sublist(
        pokemonExistedInListCount,
        pokemonList.length,
      );
    }

    final List<PokemonResponse?> result = await Future.wait(
      pokemonList.map((PokemonListResponseResult pokemon) async {
        if (pokemon.url == null) return null;
        return await homeRepositoryProvider.getPokemonByUrl(
          url: pokemon.url!,
        );
      }),
    );

    final List<PokemonResponse> newPokemonList = [];

    newPokemonList.addAll(result.whereType<PokemonResponse>());
    storageService.setPokemonList(newPokemonList);

    addPokemons(newPokemonList);

    if (pokemonExistedInListCount != null) {
      List<PokemonResponse> fetchedList = [];
      fetchedList = await fetchPokemon(limit: limit, offset: offset + limit);
      newPokemonList.addAll(fetchedList);
    }

    return newPokemonList;
  }

  void addPokemons(List<PokemonResponse> pokemon) {
    state = [...state, ...pokemon];
  }

  PokemonResponse? getPokemonById({required int id}) {
    final int index = state.indexWhere(
      (PokemonResponse pokemon) => pokemon.id == id,
    );
    return index != -1 ? state[index] : null;
  }
}
