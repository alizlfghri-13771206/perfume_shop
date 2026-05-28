import 'package:flutter/material.dart';
import '../models/perfume.dart';
import '../theme/app_theme.dart';

class PerfumeBottleWidget extends StatelessWidget {
  final Perfume perfume;
  final double size;

  const PerfumeBottleWidget({
    super.key,
    required this.perfume,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 0.6,
      height: size,
      child: CustomPaint(
        painter: _BottlePainter(
          baseColor: Colors.amber,
          accentColor: Colors.red,
        ),
      ),
    );
  }
}

class _BottlePainter extends CustomPainter {
  final Color baseColor;
  final Color accentColor;

  _BottlePainter({required this.baseColor, required this.accentColor});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final bodyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          accentColor.withOpacity(0.9),
          baseColor,
          baseColor.withOpacity(0.7),
        ],
      ).createShader(Rect.fromLTWH(0, h * 0.25, w, h * 0.65));

    final rimPaint = Paint()
      ..color = accentColor.withOpacity(0.95)
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    // Shadow
    final shadowPath = Path()
      ..moveTo(w * 0.2, h * 0.28)
      ..lineTo(w * 0.8, h * 0.28)
      ..lineTo(w * 0.9, h * 0.95)
      ..quadraticBezierTo(w * 0.5, h * 1.02, w * 0.1, h * 0.95)
      ..close();
    canvas.drawPath(shadowPath, shadowPaint);

    // Bottle body
    final bodyPath = Path()
      ..moveTo(w * 0.2, h * 0.26)
      ..lineTo(w * 0.8, h * 0.26)
      ..lineTo(w * 0.88, h * 0.92)
      ..quadraticBezierTo(w * 0.5, h * 0.98, w * 0.12, h * 0.92)
      ..close();
    canvas.drawPath(bodyPath, bodyPaint);

    // Glass highlight left
    final hlPaint = Paint()
      ..color = Colors.white.withOpacity(0.18)
      ..style = PaintingStyle.fill;
    final hlPath = Path()
      ..moveTo(w * 0.22, h * 0.28)
      ..lineTo(w * 0.32, h * 0.28)
      ..lineTo(w * 0.28, h * 0.80)
      ..lineTo(w * 0.18, h * 0.80)
      ..close();
    canvas.drawPath(hlPath, hlPaint);

    // Neck
    final neckPath = Path()
      ..moveTo(w * 0.35, h * 0.12)
      ..lineTo(w * 0.65, h * 0.12)
      ..lineTo(w * 0.68, h * 0.26)
      ..lineTo(w * 0.32, h * 0.26)
      ..close();
    canvas.drawPath(neckPath, rimPaint);

    // Cap
    final capPaint = Paint()
      ..shader = LinearGradient(
        colors: [AppColors.gold.withOpacity(0.9), AppColors.goldLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(w * 0.28, 0, w * 0.44, h * 0.14));
    final capPath = Path()
      ..moveTo(w * 0.3, h * 0.01)
      ..lineTo(w * 0.7, h * 0.01)
      ..lineTo(w * 0.65, h * 0.12)
      ..lineTo(w * 0.35, h * 0.12)
      ..close();
    canvas.drawPath(capPath, capPaint);

    // Label
    final labelPaint = Paint()
      ..color = Colors.white.withOpacity(0.12)
      ..style = PaintingStyle.fill;
    final labelRect =
        RRect.fromRectAndRadius(
          Rect.fromLTWH(w * 0.22, h * 0.45, w * 0.56, h * 0.30),
          const Radius.circular(3),
        );
    canvas.drawRRect(labelRect, labelPaint);

    // Bottom reflection
    final refPaint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..style = PaintingStyle.fill;
    final refPath = Path()
      ..moveTo(w * 0.15, h * 0.88)
      ..lineTo(w * 0.85, h * 0.88)
      ..lineTo(w * 0.88, h * 0.93)
      ..lineTo(w * 0.12, h * 0.93)
      ..close();
    canvas.drawPath(refPath, refPaint);
  }

  @override
  bool shouldRepaint(covariant _BottlePainter oldDelegate) =>
      oldDelegate.baseColor != baseColor ||
      oldDelegate.accentColor != accentColor;
}
