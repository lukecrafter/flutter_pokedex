import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/pokemon/presentation/pokemon_page.dart';
import 'package:flutter_pokedex/feature/home/presentation/home_page.dart';
import 'package:flutter_pokedex/feature/splash/presentation/splash_page.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          name: 'pokemon',
          path: 'pokemon/:id',
          builder: (BuildContext context, GoRouterState state) {
            return PokemonPage(
              id: state.params['id']!,
            );
          },
        ),
      ],
    ),
  ],
);
