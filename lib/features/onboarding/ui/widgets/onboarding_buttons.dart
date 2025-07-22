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
            TextButton(
              onPressed: () {
                context.read<OnboardingCubit>().previousPage();
                controller.previousPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                'onboarding.back'.tr(),
                style: getSemiBoldTextStyle(
                  fontSize: FontSizeManager.s16,
                  color: colorScheme.primary, // بدل الثابت
                ),
              ),
            ),
            ElevatedButton(
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
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary, // بدل الثابت
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RadiusManager.r30),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: WidthManager.w30,
                  vertical: HeightManager.h10,
                ),
              ),
              child: Text(
                state.isLastPage ? 'onboarding.get_started'.tr() : 'onboarding.next'.tr(),
                style: getSemiBoldTextStyle(
                  fontSize: FontSizeManager.s16,
                  color: colorScheme.onPrimary, // بدل الأبيض الثابت
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
