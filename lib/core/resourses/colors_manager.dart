import 'package:flutter/material.dart';

class ColorsManager {
  // 🌟 Base Identity Colors (from logo)
  static const Color primaryColor = Color(0xFF7B3FF2);     // Main Indigo chat color
  static const Color primaryColorLight = Color(0xFFB86BD1); // Light glossy version
  static const Color secondaryColor = Color(0xFFDA952E);   // Magic Lamp golden color

  // 🌈 Magic Lamp Special Colors
  static const Color lampGlow = Color(0xFFFEFDD7);         // Soft yellow glow
  static const Color lampStar = Color(0xFFEA9D2B);         // Star sparkle
  static const Color lampBrown = Color(0xFF6C380D);        // Lamp base
  static const Color accent = Color(0xFFB86BD1);           // Reused as light purple accent

  // ⚪ Neutral Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
  static const Color gray = Color(0xFF9E9E9E);
  static const Color moreGray = Color(0xFF757575);


  // 🌞 Light Theme
  static const Color backgroundLight = Color(0xFFF9F9FB);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color textLight = black;
  static const Color subTextLight = gray;

  // 🌚 Dark Theme
  static const Color backgroundDark = Color(0xFF222222);
  static const Color cardDark = Color(0xFF1E1E1E);
  static const Color whiteInDark = Color(0xFFE0E0E0);
  static const Color subTextDark = Color(0xFFBDBDBD);

  // 🎯 Status Colors (optional use)
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
}
