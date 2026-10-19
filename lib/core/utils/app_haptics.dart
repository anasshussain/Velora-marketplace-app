import 'package:flutter/services.dart';

class AppHaptics {
  const AppHaptics._();

  static void light() => HapticFeedback.lightImpact();
  static void selection() => HapticFeedback.selectionClick();
}
