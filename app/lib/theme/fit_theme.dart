import 'package:flutter/material.dart';

/// Design tokens (docs/03-design-system/02-design-tokens.md). Cool blues carry structure/AI/calm;
/// [ember] is earned — set completion, effort, celebration only. Never nav/buttons/cards/text.
class FitColors {
  static const bg = Color(0xFF0A0E14);
  static const surface = Color(0xFF141A23);
  static const surfaceRaised = Color(0xFF1C2430);
  static const border = Color(0xFF26303C);
  static const text = Color(0xFFFFFFFF);
  static const textBody = Color(0xFFD8E0EA);
  static const textMuted = Color(0xFF8A97A6);
  static const primary = Color(0xFF2563EB); // action
  static const secondary = Color(0xFF38BDF8); // emphasis
  static const ai = Color(0xFF06B6D4); // intelligence
  static const ember = Color(0xFFFF6A3D); // earned: effort / celebration
  static const emberSoft = Color(0xFFFFB089);
  static const success = Color(0xFF22C55E);
}

class FitDurations {
  static const fast = Duration(milliseconds: 120);
  static const base = Duration(milliseconds: 240);
  static const slow = Duration(milliseconds: 420);
  static const celebrate = Duration(milliseconds: 900);
}

class FitTheme {
  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: FitColors.bg,
      colorScheme: const ColorScheme.dark(
        surface: FitColors.bg,
        primary: FitColors.primary,
        secondary: FitColors.secondary,
        onSurface: FitColors.textBody,
        onPrimary: Colors.white,
      ),
    );
  }
}
