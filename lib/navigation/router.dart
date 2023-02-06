import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        return const Scaffold(
          backgroundColor: Colors.yellow,
        );
      },
      routes: [
        GoRoute(
          name: 'pokemon',
          path: 'pokemon',
          builder: (BuildContext context, GoRouterState state) {
            return Container();
          },
        ),
      ],
    ),
  ],
);
