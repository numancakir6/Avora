import 'package:flutter/material.dart';
import 'splash_page.dart';

void main() {
  runApp(const AvoraApp());
}

class AvoraApp extends StatelessWidget {
  const AvoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avora',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.white,
      ),
      home: const LexionIntroPage(),
    );
  }
}

class LexionIntroPage extends StatefulWidget {
  const LexionIntroPage({super.key});

  @override
  State<LexionIntroPage> createState() => _LexionIntroPageState();
}

class _LexionIntroPageState extends State<LexionIntroPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const SplashPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'LEXION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.w700,
            letterSpacing: 8,
          ),
        ),
      ),
    );
  }
}
