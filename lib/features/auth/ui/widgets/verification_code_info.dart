import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerificationCodeInfo extends StatelessWidget {
  final String sentOtpCode;

  const VerificationCodeInfo({super.key, required this.sentOtpCode});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.message, color: Colors.deepPurple),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '${'auth.your_verification_code_is'.tr()}: $sentOtpCode',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
