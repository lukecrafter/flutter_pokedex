import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/home/provider/home_provider.dart';
import 'package:flutter_pokedex/shared/enum/pokemon_type_enum.dart';
import 'package:flutter_pokedex/shared/extension/pokemon_response_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonLoadingPage extends ConsumerWidget {
  final String id;

  const PokemonLoadingPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PokemonResponse? pokemon =
        ref.watch(homeNotifierProvider).getPokemonById(id: int.parse(id));

    return Scaffold(
      backgroundColor: pokemon?.getMainType().color,
      body: Container(),
    );
  }
}
