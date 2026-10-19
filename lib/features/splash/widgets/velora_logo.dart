import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Code se bana hua logo mark - kisi asset par depend nahi karta.
class VeloraLogo extends StatelessWidget {
  const VeloraLogo({super.key, this.size = 88, this.color = AppColors.white});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _VeloraLogoPainter(color: color)),
    );
  }
}

class _VeloraLogoPainter extends CustomPainter {
  const _VeloraLogoPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..color = color.withOpacity(0.25);

    canvas.drawCircle(Offset(w / 2, h / 2), w / 2 - ring.strokeWidth, ring);

    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = w * 0.035
      ..color = color;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(w / 2, h / 2),
        radius: w / 2 - arc.strokeWidth,
      ),
      -1.2,
      2.2,
      false,
      arc,
    );

    // "V" mark
    final v = Path()
      ..moveTo(w * 0.32, h * 0.34)
      ..lineTo(w * 0.5, h * 0.68)
      ..lineTo(w * 0.68, h * 0.34);

    final vPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.075
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = color;

    canvas.drawPath(v, vPaint);
  }

  @override
  bool shouldRepaint(covariant _VeloraLogoPainter oldDelegate) =>
      oldDelegate.color != color;
}
