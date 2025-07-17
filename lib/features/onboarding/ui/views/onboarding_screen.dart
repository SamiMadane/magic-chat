import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/features/onboarding/data/datasources/onboarding_data.dart';
import 'package:magicchat/features/onboarding/logic/onboarding_cubit.dart';
import 'package:magicchat/features/onboarding/logic/onboarding_state.dart';
import 'package:magicchat/features/onboarding/ui/widgets/onboarding_buttons.dart';
import 'package:magicchat/features/onboarding/ui/widgets/onboarding_indicator.dart';
import 'package:magicchat/features/onboarding/ui/widgets/onboarding_page.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    
    return Scaffold(
      
      body: Stack(
        children: [
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                duration: const Duration(milliseconds: 400),
                child: Image.asset(
                  onboardingPages[state.currentPage].imagePath,
                  key: ValueKey<int>(state.currentPage),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.42,
              decoration: BoxDecoration(
               color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(RadiusManager.r20),
                  topRight: Radius.circular(RadiusManager.r20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: WidthManager.w24,
                  vertical: HeightManager.h20,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: onboardingPages.length,
                        onPageChanged: (index) {
                          BlocProvider.of<OnboardingCubit>(context).changePage(index);
                        },
                        itemBuilder: (context, index) {
                          return OnboardingPage(
                            model: onboardingPages[index],
                          );
                        },
                      ),
                    ),
                    OnboardingIndicator(
                      controller: _controller,
                      count: onboardingPages.length,
                    ),
                    SizedBox(height: HeightManager.h50),
                    OnboardingButtons(controller: _controller),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
