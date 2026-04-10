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
      home: const SplashPage(),
    );
  }
}
