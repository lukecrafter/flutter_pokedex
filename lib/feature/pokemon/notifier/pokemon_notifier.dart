import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/home/provider/home_provider.dart';
import 'package:flutter_pokedex/feature/pokemon/provider/pokemon_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_notifier.g.dart';

@riverpod
class AsyncPokemon extends _$AsyncPokemon {
  Future<PokemonResponse> _fetchPokemon(String id) async {
    final PokemonResponse? pokemon =
        ref.read(homeNotifierProvider).getPokemonById(id: int.parse(id));
    if (pokemon != null) {
      return pokemon;
    }

    try {
      final PokemonResponse response =
          await ref.read(pokemonRepositoryProvider).getPokemonById(id: id);

      return response;
    } catch (e) {
      state = AsyncValue.error('An error occurred', StackTrace.current);
      throw Exception('An error occurred');
    }
  }

  @override
  FutureOr<PokemonResponse> build(String id) async {
    // Load initial todo list from the remote repository
    return _fetchPokemon(id);
  }
}
