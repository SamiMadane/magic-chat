import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

class FinishSetupButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FinishSetupButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'auth.user_name.finish_setup'.tr(),
          style: getBoldTextStyle(
            fontSize: FontSizeManager.s18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
