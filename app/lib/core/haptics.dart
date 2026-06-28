import 'package:flutter/services.dart';

/// The FitMind haptic vocabulary (docs/03-design-system/06-haptic-language.md).
/// One event → one pattern, centralized here so the feel stays consistent and is tuned in one place.
/// No widget should call [HapticFeedback] directly.
class Haptics {
  const Haptics();

  void button() => HapticFeedback.selectionClick();
  void rep() => HapticFeedback.selectionClick();
  void restEnding() => HapticFeedback.lightImpact();
  void restFinished() => HapticFeedback.lightImpact();
  void setComplete() => HapticFeedback.mediumImpact(); // the punctuation of effort
  void failedSet() => HapticFeedback.lightImpact(); // acknowledged, never shaming
  void personalBest() => HapticFeedback.heavyImpact();

  Future<void> workoutComplete() async {
    await HapticFeedback.heavyImpact();
    await Future<void>.delayed(const Duration(milliseconds: 90));
    await HapticFeedback.heavyImpact();
  }
}
