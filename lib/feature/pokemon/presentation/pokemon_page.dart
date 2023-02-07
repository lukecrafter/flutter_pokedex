import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/pokemon/notifier/pokemon_notifier.dart';
import 'package:flutter_pokedex/feature/pokemon/presentation/widget/pokemon_data_page.dart';
import 'package:flutter_pokedex/feature/pokemon/presentation/widget/pokemon_loading_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonPage extends ConsumerStatefulWidget {
  final String id;

  const PokemonPage({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonPageState();
}

class _PokemonPageState extends ConsumerState<PokemonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<PokemonResponse> asyncPokemon =
        ref.watch(asyncPokemonProvider(widget.id));

    return asyncPokemon.when(
      data: (PokemonResponse data) => PokemonDataPage(
        id: widget.id,
        pokemon: data,
      ),
      loading: () => PokemonLoadingPage(id: widget.id),
      error: (Object error, StackTrace stack) => Container(),
    );
  }
}
