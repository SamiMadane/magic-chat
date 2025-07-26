import 'package:flutter/material.dart';

/// A customizable button widget that supports three types:
/// Elevated, Text, and Outlined buttons.
/// 
/// You can easily switch between button types using the [type] parameter.
/// Supports optional icons, custom text styles, and padding.
///
/// Usage example:
/// ```dart
/// CustomButton(
///   label: 'Submit',
///   onPressed: () { /* your code */ },
///   type: ButtonType.elevated,
///   icon: Icons.send,
/// )
/// ```
class CustomButton extends StatelessWidget {
  final String label;               // The button text
  final VoidCallback onPressed;    // Callback when button is pressed
  final ButtonType type;            // Type of button: Elevated, Text, Outlined
  final IconData? icon;             // Optional icon to display
  final TextStyle? textStyle;       // Optional custom text style
  final EdgeInsetsGeometry? padding; // Optional padding inside the button (not yet used here)

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.elevated,
    this.icon,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            // You can add padding here if you want:
            // padding: padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: icon == null
              ? Text(label, style: textStyle)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 20),
                    SizedBox(width: 8),
                    Text(label, style: textStyle),
                  ],
                ),
        );

      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            // Optionally add padding here if needed
          ),
          child: Text(
            label,
            style: textStyle ?? TextStyle(color: colorScheme.primary),
          ),
        );

      case ButtonType.outlined:
        return OutlinedButton.icon(
          onPressed: onPressed,
          icon: icon != null
              ? Icon(icon, color: colorScheme.primary)
              : const SizedBox.shrink(),
          label: Text(
            label,
            style: textStyle ?? TextStyle(color: colorScheme.primary),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
    }
  }
}

/// Enum to select the button type for [CustomButton].
enum ButtonType {
  elevated,
  text,
  outlined,
}
