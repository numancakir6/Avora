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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await precacheImage(
        const AssetImage('assets/lexion/lexion.png'),
        context,
      );

      await Future.delayed(const Duration(milliseconds: 900));

      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SplashPage(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.black,
      child: Center(
        child: Image(
          image: AssetImage('assets/lexion/lexion.png'),
          width: 170,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
