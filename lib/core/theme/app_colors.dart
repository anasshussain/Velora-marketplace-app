import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // Surfaces
  static const Color background = Color(0xFFF1F2F4);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceAlt = Color(0xFFF6F7F9);
  static const Color border = Color(0xFFECEEF1);

  // Dark tones
  static const Color dark = Color(0xFF111315);
  static const Color darkSoft = Color(0xFF1B1E21);
  static const Color darkElevated = Color(0xFF26292D);

  // Text
  static const Color textPrimary = Color(0xFF121417);
  static const Color textSecondary = Color(0xFF8A9099);
  static const Color textTertiary = Color(0xFFB6BBC3);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textOnDarkSoft = Color(0xFFB9BEC6);

  // Accents
  static const Color star = Color(0xFFFFB020);
  static const Color accent = Color(0xFFFFC53D);
  static const Color success = Color(0xFF29C36A);
  static const Color danger = Color(0xFFFF4D4F);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color shadow = Color(0x140E1726);

  // Gradients
  static const List<Color> heroGradient = [Color(0xFF2A2D31), Color(0xFF0C0E10)];
  static const List<Color> walletGradient = [
    Color(0xFF5B2D91),
    Color(0xFF3A1D66),
    Color(0xFF201138),
  ];
  static const List<Color> placeholderGradient = [
    Color(0xFFE7E9EE),
    Color(0xFFD3D7DE),
  ];
}
