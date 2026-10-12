import 'dart:math' as math;

import 'package:flutter/material.dart';

/// The Command Center mark, rendered at device resolution so it stays crisp at
/// both small header sizes and the larger startup splash size.
class CommandCenterMark extends StatelessWidget {
  const CommandCenterMark({
    super.key,
    this.size = 32,
    this.markScale = 0.30,
    this.backgroundColor,
    this.markColor,
  });

  final double size;
  final double markScale;
  final Color? backgroundColor;
  final Color? markColor;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return CustomPaint(
      size: Size.square(size),
      painter: _CommandCenterMarkPainter(
        backgroundColor: backgroundColor ?? const Color(0xFF09090B),
        markColor: markColor ?? scheme.onSurface,
        markScale: markScale,
      ),
    );
  }
}

class _CommandCenterMarkPainter extends CustomPainter {
  const _CommandCenterMarkPainter({
    required this.backgroundColor,
    required this.markColor,
    required this.markScale,
  });

  final Color backgroundColor;
  final Color markColor;
  final double markScale;

  @override
  void paint(Canvas canvas, Size size) {
    final bounds = Offset.zero & size;
    final radius = size.shortestSide / 2;
    final center = bounds.center;

    canvas.drawRRect(
      RRect.fromRectAndRadius(bounds, Radius.circular(radius * 0.22)),
      Paint()..color = backgroundColor,
    );

    final stroke = Paint()
      ..color = markColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final ringRadius = size.shortestSide * markScale;
    stroke.strokeWidth = math.max(size.shortestSide * 0.045, 1.25);
    const dashCount = 28;
    const dashFraction = 0.55;
    final step = 2 * math.pi / dashCount;
    final dashSweep = step * dashFraction;
    for (var i = 0; i < dashCount; i++) {
      final start = -math.pi / 2 + i * step;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: ringRadius),
        start,
        dashSweep,
        false,
        stroke,
      );
    }

    final triangleRadius = ringRadius * 0.66;
    final triangle = <Offset>[
      for (final angle in const [-math.pi / 2, 5 * math.pi / 6, math.pi / 6])
        center + Offset(math.cos(angle), math.sin(angle)) * triangleRadius,
    ];
    final trianglePath = Path()
      ..moveTo(triangle[0].dx, triangle[0].dy)
      ..lineTo(triangle[1].dx, triangle[1].dy)
      ..lineTo(triangle[2].dx, triangle[2].dy)
      ..close();
    stroke.strokeWidth = math.max(size.shortestSide * 0.07, 1.5);
    canvas.drawPath(trianglePath, stroke);

    canvas.drawCircle(
      center,
      radius * 0.066,
      Paint()
        ..color = markColor
        ..isAntiAlias = true,
    );
  }

  @override
  bool shouldRepaint(_CommandCenterMarkPainter oldDelegate) =>
      oldDelegate.backgroundColor != backgroundColor ||
      oldDelegate.markColor != markColor ||
      oldDelegate.markScale != markScale;
}
