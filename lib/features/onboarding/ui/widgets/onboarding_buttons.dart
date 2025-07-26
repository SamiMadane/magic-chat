import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/onboarding/logic/onboarding_cubit.dart';
import 'package:magicchat/features/onboarding/logic/onboarding_state.dart';
import 'package:magicchat/core/widgets/custom_button.dart'; // استيراد الزر الجديد

class OnboardingButtons extends StatelessWidget {
  final PageController controller;

  const OnboardingButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // زر النصي "Back"
            CustomButton(
              label: 'onboarding.back'.tr(),
              onPressed: () {
                context.read<OnboardingCubit>().previousPage();
                controller.previousPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              },
              type: ButtonType.text,
              textStyle: getSemiBoldTextStyle(
                fontSize: FontSizeManager.s16,
                color: colorScheme.primary,
              ),
            ),

            // زر Elevated "Next" أو "Get Started"
            CustomButton(
              label: state.isLastPage ? 'onboarding.get_started'.tr() : 'onboarding.next'.tr(),
              onPressed: () {
                if (state.isLastPage) {
                  context.pushReplacementNamed(Routes.homeScreen);
                } else {
                  context.read<OnboardingCubit>().nextPage();
                  controller.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                  );
                }
              },
              type: ButtonType.elevated,
              textStyle: getSemiBoldTextStyle(
                fontSize: FontSizeManager.s16,
                color: colorScheme.onPrimary,
              ),
              // لتخصيص شكل الزر مثل original:
              padding: EdgeInsets.symmetric(
                horizontal: WidthManager.w30,
                vertical: HeightManager.h10,
              ),
              // يمكن تعديل شكل الزر داخل CustomButton لتدعم padding ورادياس أكبر
              // حالياً radius الافتراضي 12، لو تريد 30 استدعي مع تعديل
            ),
          ],
        );
      },
    );
  }
}
