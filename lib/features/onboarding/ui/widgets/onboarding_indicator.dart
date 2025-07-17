import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const OnboardingIndicator({super.key, required this.controller, required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        activeDotColor: theme.colorScheme.primary,
        dotColor: theme.disabledColor, // بديل عن لون رمادي فاتح يتغير حسب الثيم
        dotHeight: 8,
        dotWidth: 8,
        spacing: 6,
      ),
    );
  }
}
