import 'package:flutter/material.dart';

class CustomShadows extends ThemeExtension<CustomShadows> {
  final List<BoxShadow> bottomNavShadow;

  CustomShadows({required this.bottomNavShadow});

  @override
  CustomShadows copyWith({List<BoxShadow>? bottomNavShadow}) {
    return CustomShadows(
      bottomNavShadow: bottomNavShadow ?? this.bottomNavShadow,
    );
  }

  @override
  CustomShadows lerp(ThemeExtension<CustomShadows>? other, double t) {
    if (other is! CustomShadows) return this;
    // هنا يمكن عمل lerp بين القيم لو تريد دعم التحولات بين ثيمات
    return t < 0.5 ? this : other;
  }
}
