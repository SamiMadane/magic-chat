import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/home/logic/cubit/home_cubit.dart';
import 'package:magicchat/features/home/ui/views/home_screen.dart';
import 'package:magicchat/features/onboarding/logic/onboarding_cubit.dart';
import 'package:magicchat/features/onboarding/ui/views/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
       case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => OnboardingCubit(),
                child: const OnboardingScreen(),
              ),
        );
        case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => HomeCubit(),
                child: const HomeScreen(),
              ),
        );
      default:
        return null;
    }
  }
}
