// GetIt => class dependency injection (files depend on each other).
import 'package:get_it/get_it.dart';
import 'package:magicchat/core/service/theme_service.dart';
import 'package:magicchat/features/home/logic/cubit/home_cubit.dart';
import 'package:magicchat/features/onboarding/logic/onboarding_cubit.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());

  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  getIt.registerLazySingleton<ThemeService>(() => ThemeService());
  getIt.registerLazySingleton(() => SettingsCubit(getIt<ThemeService>()));
}
