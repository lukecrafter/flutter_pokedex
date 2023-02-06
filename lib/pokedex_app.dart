import 'package:flutter/material.dart';
import 'package:flutter_pokedex/navigation/router.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: DefaultTextStyle(
            style: const TextStyle(
              height: 1.0,
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
