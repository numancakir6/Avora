import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'start_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _logoFadeAnim;
  late final Animation<double> _logoScaleAnim;
  late final Animation<double> _logoRotateAnim;

  late final Animation<double> _titleOpacityAnim;
  late final Animation<double> _titleLiftAnim;
  late final Animation<double> _titleBorderAnim;

  late final Animation<double> _groupShiftAnim;

  late final Animation<double> _formOpacityAnim;
  late final Animation<double> _formSlideAnim;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7500),
    );

    _logoFadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.00, 0.10, curve: Curves.easeOut),
      ),
    );

    _logoScaleAnim = Tween<double>(begin: 0.82, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.00, 0.14, curve: Curves.easeOutCubic),
      ),
    );

    _logoRotateAnim =
        TweenSequence<double>([
          TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 24),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.0,
              end: pi / 3,
            ).chain(CurveTween(curve: Curves.easeOutCubic)),
            weight: 24,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: pi / 3,
              end: -pi / 3,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 26,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: -pi / 3,
              end: 0.0,
            ).chain(CurveTween(curve: Curves.easeOutQuart)),
            weight: 34,
          ),
          TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 12),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.05, 0.55),
          ),
        );

    _titleOpacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.54, 0.68, curve: Curves.easeOut),
      ),
    );

    _titleLiftAnim = Tween<double>(begin: 18, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.54, 0.70, curve: Curves.easeOutCubic),
      ),
    );

    _titleBorderAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.56, 0.74, curve: Curves.easeInOutCubic),
      ),
    );

    _groupShiftAnim = Tween<double>(begin: 0, end: -140).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.72, 0.88, curve: Curves.easeInOutCubic),
      ),
    );

    _formOpacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.80, 1.00, curve: Curves.easeOut),
      ),
    );

    _formSlideAnim = Tween<double>(begin: 34, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.80, 1.00, curve: Curves.easeOutCubic),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _continue() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const StartPage()));
  }

  InputDecoration _fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54, fontSize: 16),
      filled: true,
      fillColor: Colors.white.withOpacity(0.045),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.08), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.32),
          width: 1.2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Stack(
              children: [
                Center(
                  child: Transform.translate(
                    offset: Offset(0, _groupShiftAnim.value),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: _logoFadeAnim.value,
                          child: Transform.scale(
                            scale: _logoScaleAnim.value,
                            child: Transform.rotate(
                              angle: _logoRotateAnim.value,
                              child: SvgPicture.asset(
                                'assets/avora/logo.svg',
                                width: 500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Opacity(
                          opacity: _titleOpacityAnim.value,
                          child: Transform.translate(
                            offset: Offset(0, _titleLiftAnim.value - 80),
                            child: SizedBox(
                              width: 176,
                              height: 66,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomPaint(
                                    size: const Size(176, 66),
                                    painter: _RoundedRectDrawPainter(
                                      progress: _titleBorderAnim.value,
                                      color: Colors.white,
                                      strokeWidth: 1.4,
                                      radius: 18,
                                    ),
                                  ),
                                  const Text(
                                    'AVORA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.60),
                  child: Opacity(
                    opacity: _formOpacityAnim.value,
                    child: Transform.translate(
                      offset: Offset(0, _formSlideAnim.value),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.015),
                                      blurRadius: 20,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: nameController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  decoration: _fieldDecoration('İsim'),
                                ),
                              ),
                              const SizedBox(height: 14),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.015),
                                      blurRadius: 20,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  decoration: _fieldDecoration('E-posta'),
                                ),
                              ),
                              const SizedBox(height: 18),
                              SizedBox(
                                width: double.infinity,
                                height: 58,
                                child: ElevatedButton(
                                  onPressed: _continue,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: const Text(
                                    'Devam Et',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _RoundedRectDrawPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;
  final double radius;

  const _RoundedRectDrawPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final clamped = progress.clamp(0.0, 1.0);

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    final path = Path()..addRRect(rrect);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (final metric in path.computeMetrics()) {
      final drawLength = metric.length * clamped;
      final extract = metric.extractPath(0, drawLength);
      canvas.drawPath(extract, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _RoundedRectDrawPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius;
  }
}
