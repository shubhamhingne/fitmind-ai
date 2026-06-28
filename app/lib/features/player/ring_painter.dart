import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/fit_theme.dart';

/// The progress ring — the app's operating system, rendered once and reused at every scope
/// (set / session / day / streak). Sweeps cool `primary → ai`; ember enters only on
/// [emberFlash] (a set completing). Kept in a [RepaintBoundary] so only it repaints per frame.
class RingPainter extends CustomPainter {
  RingPainter({
    required this.progress, // 0..1 session progress
    required this.glow, // 0..1 breathe / anticipation
    this.emberFlash = 0, // 0..1 set-complete flash (earned)
  });

  final double progress;
  final double glow;
  final double emberFlash;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = math.min(size.width, size.height) / 2 - 24;
    if (radius <= 0) return;
    final stroke = 10.0 + 6.0 * glow;
    final rect = Rect.fromCircle(center: center, radius: radius);
    const start = -math.pi / 2;
    final sweep = (2 * math.pi) * progress.clamp(0.0, 1.0);

    // Track.
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..color = FitColors.border,
    );

    if (sweep <= 0) return;

    // Progress arc — calm → AI, tipping toward ember as a set closes.
    final endColor = Color.lerp(FitColors.ai, FitColors.ember, emberFlash)!;
    final shader = SweepGradient(
      startAngle: start,
      endAngle: start + sweep + 0.0001,
      colors: [FitColors.primary, FitColors.ai, endColor],
      transform: const GradientRotation(-math.pi / 2),
    ).createShader(rect);

    canvas.drawArc(
      rect,
      start,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = stroke
        ..shader = shader,
    );

    // Earned ember glow on completion.
    if (emberFlash > 0) {
      canvas.drawArc(
        rect,
        start,
        sweep,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = stroke
          ..color = FitColors.ember.withValues(alpha: 0.45 * emberFlash)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10 * emberFlash),
      );
    }
  }

  @override
  bool shouldRepaint(RingPainter old) =>
      old.progress != progress || old.glow != glow || old.emberFlash != emberFlash;
}
