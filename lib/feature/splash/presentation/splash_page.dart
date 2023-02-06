import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 249, 249, 1.0),
      body: Center(
        child: Image.asset(
          'assets/images/splash/splash.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
