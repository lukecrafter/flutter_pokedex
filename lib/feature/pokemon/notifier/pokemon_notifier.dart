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

  // Future<void> addTodo(Todo todo) async {
  //   // Set the state to loading
  //   state = const AsyncValue.loading();
  //   // Add the new todo and reload the todo list from the remote repository
  //   state = await AsyncValue.guard(() async {
  //     await http.post('api/todos', todo.toJson());
  //     return _fetchTodo();
  //   });
  // }

  // // Let's allow removing todos
  // Future<void> removeTodo(String todoId) async {
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() async {
  //     await http.delete('api/todos/$todoId');
  //     return _fetchTodo();
  //   });
  // }

  // // Let's mark a todo as completed
  // Future<void> toggle(String todoId) async {
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() async {
  //     await http.patch(
  //       'api/todos/$todoId',
  //       <String, dynamic>{'completed': true},
  //     );
  //     return _fetchTodo();
  //   });
  // }
}