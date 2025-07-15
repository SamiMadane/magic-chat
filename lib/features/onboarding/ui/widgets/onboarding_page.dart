// import 'package:flutter/material.dart';
// import 'package:leuko_care/core/resources/colors_manager.dart';
// import 'package:leuko_care/core/resources/fonts_manager.dart';
// import 'package:leuko_care/core/resources/sizes_util_manager.dart';
// import 'package:leuko_care/core/resources/styles_manager.dart';
// import '../../data/models/onboarding_model.dart';

// class OnboardingPage extends StatelessWidget {
//   final OnboardingModel model;

//   const OnboardingPage({super.key, required this.model});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: IntrinsicHeight(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: WidthManager.w24),
//           child: Column(
//             children: [
//               SizedBox(height: HeightManager.h60),

//               Text(
//                 model.title,
//                 textAlign: TextAlign.center,
//                 style: getBoldTextStyle(
//                   fontSize: FontSizeManager.s22,
//                   color: ColorsManager.darkBlue,
//                 ),
//               ),
//               SizedBox(height: HeightManager.h12),
//               Text(
//                 model.subtitle,
//                 textAlign: TextAlign.center,
//                 style: getMediumTextStyle(
//                   fontSize: FontSizeManager.s13,
//                   color: ColorsManager.gray,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
