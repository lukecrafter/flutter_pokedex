import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/assets.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    final DateTime startTime = DateTime.now();
    Future.microtask(() async {
      // TODO: initialize
      await Future.delayed(const Duration(seconds: 2), () => null);
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
