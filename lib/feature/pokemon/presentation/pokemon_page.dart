import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/pokemon/notifier/pokemon_notifier.dart';
import 'package:flutter_pokedex/feature/pokemon/presentation/widget/pokemon_loading_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonPage extends ConsumerStatefulWidget {
  final String id;

  const PokemonPage({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<PokemonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<PokemonResponse> asyncPokemon =
        ref.watch(asyncPokemonProvider(widget.id));

    return asyncPokemon.when(
      data: (PokemonResponse? data) {
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: Hero(
                  tag: 'pokemon-${widget.id}',
                  child: CachedNetworkImage(
                    imageUrl: data?.imageUrl ?? '',
                    imageBuilder: (
                      BuildContext context,
                      ImageProvider<Object> imageProvider,
                    ) {
                      return SizedBox(
                        width: 80.0,
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    errorWidget: (BuildContext context, String url, error) =>
                        Container(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => PokemonLoadingPage(id: widget.id),
      error: (Object error, StackTrace stack) => Container(),
    );
  }
}
