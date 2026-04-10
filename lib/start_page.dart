import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  static const Color gold = Color(0xFFFFC857);
  static const Color green = Color(0xFF22C55E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
          child: Column(
            children: [
              const _TopBar(),
              const Spacer(),
              const _CenterSection(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  static const Color _gold = Color(0xFFFFC857);
  static const Color _green = Color(0xFF22C55E);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _BalanceDisplay(
          icon: _SoftCoinIcon(),
          value: '240',
          color: _gold,
          left: true,
        ),
        Spacer(),
        _BalanceDisplay(
          icon: _RewardBalanceIcon(),
          value: '125',
          color: _green,
          left: false,
        ),
      ],
    );
  }
}

class _BalanceDisplay extends StatelessWidget {
  final Widget icon;
  final String value;
  final Color color;
  final bool left;

  const _BalanceDisplay({
    required this.icon,
    required this.value,
    required this.color,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (left) ...[
          _GlowWrap(color: color, child: icon),
          const SizedBox(width: 8),
        ],
        Text(
          value,
          style: GoogleFonts.manrope(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.3,
            shadows: [
              Shadow(color: color.withValues(alpha: 0.35), blurRadius: 12),
            ],
          ),
        ),
        if (!left) ...[
          const SizedBox(width: 8),
          _GlowWrap(color: color, child: icon),
        ],
      ],
    );
  }
}

class _GlowWrap extends StatelessWidget {
  final Widget child;
  final Color color;

  const _GlowWrap({required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.18),
            blurRadius: 14,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _CenterSection extends StatelessWidget {
  const _CenterSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _AvoraTitleBox(),
        const SizedBox(height: 64),
        _MainButton(text: 'Başla', filled: true, onTap: () {}),
        const SizedBox(height: 16),
        _MainButton(text: 'Market', filled: false, onTap: () {}),
        const SizedBox(height: 16),
        _MainButton(text: 'Bize Ulaşın', filled: false, onTap: () {}),
      ],
    );
  }
}

class _AvoraTitleBox extends StatelessWidget {
  const _AvoraTitleBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 198,
      height: 74,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.04),
            blurRadius: 22,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SizedBox(
        width: 198,
        height: 74,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(198, 74),
              painter: _RoundedRectPainter(),
            ),
            Text(
              'AVORA',
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontSize: 29,
                fontWeight: FontWeight.w800,
                letterSpacing: 5.2,
                shadows: const [
                  Shadow(
                    color: Color.fromRGBO(255, 255, 255, 0.12),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundedRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(1, 1, size.width - 2, size.height - 2);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(20));

    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.92)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MainButton extends StatelessWidget {
  final String text;
  final bool filled;
  final VoidCallback onTap;

  const _MainButton({
    required this.text,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 268,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: filled
              ? Colors.white
              : Colors.white.withValues(alpha: 0.045),
          foregroundColor: filled ? Colors.black : Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          side: filled
              ? BorderSide.none
              : BorderSide(
                  color: Colors.white.withValues(alpha: 0.14),
                  width: 1,
                ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: GoogleFonts.manrope(
            fontSize: 14.8,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.1,
            height: 1,
            color: filled ? Colors.black : Colors.white,
            shadows: filled
                ? []
                : [
                    Shadow(
                      color: Colors.white.withValues(alpha: 0.16),
                      blurRadius: 6,
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}

class _SoftCoinIcon extends StatelessWidget {
  const _SoftCoinIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 18,
      height: 18,
      child: CustomPaint(painter: _SoftCoinPainter()),
    );
  }
}

class _SoftCoinPainter extends CustomPainter {
  const _SoftCoinPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final outer = Paint()
      ..color = const Color(0xFFFFC857)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    final mid = Paint()
      ..color = const Color(0xFFFFC857).withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final inner = Paint()
      ..color = const Color(0xFFFFC857)
      ..style = PaintingStyle.fill;

    final highlight = Paint()
      ..color = Colors.white.withValues(alpha: 0.35)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 2 - 1.1, outer);
    canvas.drawCircle(center, size.width / 2 - 4.0, mid);
    canvas.drawCircle(center, 2.3, inner);

    canvas.drawCircle(
      Offset(size.width * 0.34, size.height * 0.32),
      1.35,
      highlight,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RewardBalanceIcon extends StatelessWidget {
  const _RewardBalanceIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 18,
      height: 20,
      child: CustomPaint(painter: _RewardPainter()),
    );
  }
}

class _RewardPainter extends CustomPainter {
  const _RewardPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final green = const Color(0xFF22C55E);

    final p = Paint()
      ..color = green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.65
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final accent = Paint()
      ..color = green.withValues(alpha: 0.22)
      ..style = PaintingStyle.fill;

    final glowRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(1.5, 2, size.width - 3, size.height - 4),
      const Radius.circular(6),
    );
    canvas.drawRRect(glowRect, accent);

    final path = Path()
      ..moveTo(size.width * 0.33, size.height * 0.08)
      ..lineTo(size.width * 0.33, size.height * 0.92)
      ..moveTo(size.width * 0.67, size.height * 0.08)
      ..lineTo(size.width * 0.67, size.height * 0.92)
      ..moveTo(size.width * 0.18, size.height * 0.34)
      ..lineTo(size.width * 0.82, size.height * 0.34)
      ..moveTo(size.width * 0.18, size.height * 0.66)
      ..lineTo(size.width * 0.76, size.height * 0.66);

    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
