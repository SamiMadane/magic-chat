import 'package:flutter/material.dart';

@immutable
class CustomShimmerTheme extends ThemeExtension<CustomShimmerTheme> {
  final Color baseColor;
  final Color highlightColor;

  const CustomShimmerTheme({
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  CustomShimmerTheme copyWith({
    Color? baseColor,
    Color? highlightColor,
  }) {
    return CustomShimmerTheme(
      baseColor: baseColor ?? this.baseColor,
      highlightColor: highlightColor ?? this.highlightColor,
    );
  }

  @override
  CustomShimmerTheme lerp(ThemeExtension<CustomShimmerTheme>? other, double t) {
    if (other is! CustomShimmerTheme) return this;
    return CustomShimmerTheme(
      baseColor: Color.lerp(baseColor, other.baseColor, t)!,
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t)!,
    );
  }
}
