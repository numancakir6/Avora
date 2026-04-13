import 'package:flutter/material.dart';
import 'splash_page.dart';

class LexionIntroPage extends StatefulWidget {
  const LexionIntroPage({super.key});

  @override
  State<LexionIntroPage> createState() => _LexionIntroPageState();
}

class _LexionIntroPageState extends State<LexionIntroPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const SplashPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/lexion/lexion.png',
          width: 160, // iOS gibi ortalı ve sade
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
