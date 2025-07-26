import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/auth/ui/views/otp_verification_screen.dart';
import 'package:magicchat/features/auth/ui/views/phone_input_screen.dart';
import 'package:magicchat/features/auth/ui/views/username_setup_screen.dart';
import 'package:magicchat/core/models/user/user_model.dart';
import 'package:magicchat/features/home/logic/cubit/home_cubit.dart';
import 'package:magicchat/features/home/ui/views/home_screen.dart';
import 'package:magicchat/features/onboarding/logic/onboarding_cubit.dart';
import 'package:magicchat/features/onboarding/ui/views/onboarding_screen.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';
import 'package:magicchat/features/settings/ui/views/settings_screen.dart';

final getIt = GetIt.instance;

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<OnboardingCubit>(),
            child: const OnboardingScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>()..checkUserLoginStatus(),
            child: const HomeScreen(),
          ),
        );
      case Routes.settingsScreen:
        final args = arguments as Map?;
        final isLoggedIn = args?['isLoggedIn'] as bool? ?? false;
        final user = args?['user'] as UserModel?;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<SettingsCubit>()..loadSettings(),
              ),
              BlocProvider.value(
                value: getIt<AuthCubit>(), // توفّر AuthCubit هنا
              ),
            ],
            child: SettingsScreen(
              isLoggedIn: isLoggedIn,
              user: user,
            ),
          ),
        );

      case Routes.phoneInputScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AuthCubit>(),
            child: const PhoneInputScreen(),
          ),
        );
      case Routes.otpVerificationScreen:
        final arguments = settings.arguments as Map?;

        final phoneNumber = arguments?['phoneNumber'] as String;
        final sentOtpCode = arguments?['sentOtpCode'] as String;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AuthCubit>(), // أو أي طريقة تحضر بها الـ Cubit عندك
            child: OtpVerificationScreen(
              phoneNumber: phoneNumber,
              sentOtpCode: sentOtpCode,
            ),
          ),
        );
      case Routes.usernameSetupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AuthCubit>(),
            child: const UsernameSetupScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
