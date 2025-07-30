import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/widgets/custom_button.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: CustomButton(
        label: label,
        onPressed: onPressed,
        type: ButtonType.elevated,
        textStyle: getBoldTextStyle(
          fontSize: FontSizeManager.s18,
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}
