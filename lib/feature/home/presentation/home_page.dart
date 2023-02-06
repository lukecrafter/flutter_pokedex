import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/home/provider/home_provider.dart';
import 'package:flutter_pokedex/shared/assets.dart';
import 'package:flutter_pokedex/shared/pokemon_type_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:flutter_pokedex/feature/home/presentation/widget/pokemon_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final int _pageSize = 20;
  final PagingController<int, PokemonResponse> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((int pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<PokemonResponse> newPokemon =
          await ref.read(homeNotifierProvider).fetchPokemon(
                limit: _pageSize.toString(),
                offset: pageKey.toString(),
              );

      final bool isLastPage = newPokemon.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newPokemon);
      } else {
        final int nextPageKey = pageKey + newPokemon.length;
        _pagingController.appendPage(newPokemon, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(219, 47, 55, 1.0),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Image.asset(pokeballIcon),
              )
                  .animate(
                    onPlay: (AnimationController controller) =>
                        controller.repeat(),
                  )
                  .shakeY(
                    duration: const Duration(seconds: 2),
                    delay: const Duration(seconds: 10),
                    hz: 4,
                    amount: 2.5,
                  )
                  .shimmer(
                    delay: const Duration(seconds: 10),
                    duration: const Duration(seconds: 2),
                    color: Colors.white,
                  ),
              const SizedBox(width: 10),
              const Text('Pokédex'),
            ],
          ),
        ),
      ),
      body: PagedGridView<int, PokemonResponse>(
        pagingController: _pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          crossAxisCount: 2,
          mainAxisExtent: 120.0,
        ),
        showNewPageProgressIndicatorAsGridChild: false,
        padding: const EdgeInsets.all(12.0),
        builderDelegate: PagedChildBuilderDelegate<PokemonResponse>(
          itemBuilder: (BuildContext context, PokemonResponse item, int index) {
            return PokemonCard(
              id: item.id ?? 0,
              name: item.name ?? '',
              types: item.types ?? [],
              color: item.getMainType().color,
              imageUrl: item.imageUrl,
            );
          },
        ),
      ),
    );
  }
}
