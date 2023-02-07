import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/home/provider/home_provider.dart';
import 'package:flutter_pokedex/shared/enum/pokemon_type_enum.dart';
import 'package:flutter_pokedex/shared/util/pokemon_util.dart';
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
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fromRelativeRect(
            rect: const RelativeRect.fromLTRB(30.0, 0, 30, 0),
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: CachedNetworkImage(
                imageUrl: getPokemonOfficialImageUrl(id.toString()),
                fit: BoxFit.contain,
                errorWidget: (BuildContext context, String url, error) =>
                    Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
