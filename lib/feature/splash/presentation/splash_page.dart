import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/home/provider/home_provider.dart';
import 'package:flutter_pokedex/provider/local_storage_provider.dart';
import 'package:flutter_pokedex/shared/assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    Future.microtask(() async {
      final List result = await Future.wait([
        ref.read(storageServiceProvider).getAllPokemon(),
        Future.delayed(const Duration(seconds: 2)),
      ]);
      ref.read(homeNotifierProvider).addPokemons(result[0]);

      GoRouter.of(context).pushReplacementNamed('home');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 249, 249, 1.0),
      body: Center(
        child: Image.asset(
          splashGif,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
