import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/onboarding_data.dart';
import '../widgets/onboarding_buttons.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('sami madane',style: TextStyle(fontSize: 20,),)
        ],
      ),
      // body: Stack(
      //   children: [
      //     BlocBuilder<OnboardingCubit, OnboardingState>(
      //       builder: (context, state) {
      //         return AnimatedSwitcher(
      //           switchInCurve: Curves.easeInOut,
      //           switchOutCurve: Curves.easeInOut,
      //           duration: const Duration(milliseconds: 400),
      //           child: Image.asset(
      //             onboardingPages[state.currentPage].imagePath,
      //             key: ValueKey<int>(state.currentPage),
      //             height: MediaQuery.of(context).size.height * 0.6,
      //             width: double.infinity,
      //             fit: BoxFit.cover,
      //           ),
      //         );
      //       },
      //     ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Container(
      //         width: double.infinity,
      //         height: MediaQuery.of(context).size.height * 0.42,
      //         decoration: BoxDecoration(
      //           color: ColorsManager.white,
      //           borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(RadiusManager.r20),
      //             topRight: Radius.circular(RadiusManager.r20),
      //           ),
      //         ),
      //         child: Padding(
      //           padding: EdgeInsets.symmetric(
      //             horizontal: WidthManager.w24,
      //             vertical: HeightManager.h20,
      //           ),
      //           child: Column(
      //             children: [
      //               Expanded(
      //                 child: PageView.builder(
      //                   controller: _controller,
      //                   itemCount: onboardingPages.length,
      //                   onPageChanged: (index) {
      //                     BlocProvider.of<OnboardingCubit>(context).changePage(index);
      //                   },
      //                   itemBuilder: (context, index) {
      //                     return OnboardingPage(
      //                       model: onboardingPages[index],
      //                     );
      //                   },
      //                 ),
      //               ),
      //               OnboardingIndicator(
      //                 controller: _controller,
      //                 count: onboardingPages.length,
      //               ),
      //               SizedBox(height: HeightManager.h50),
      //               OnboardingButtons(controller: _controller),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
