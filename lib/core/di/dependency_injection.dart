// GetIt => class dependency injection (files depend on each other).
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:magicchat/core/service/theme_service.dart';
import 'package:magicchat/features/auth/data/repo/auth_repo.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/home/data/repo/user_repo.dart';
import 'package:magicchat/features/home/logic/cubit/home_cubit.dart';
import 'package:magicchat/features/onboarding/logic/onboarding_cubit.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());

  getIt.registerLazySingleton<UserRepository>(
      () => UserRepository(firestore: getIt<FirebaseFirestore>()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit(userRepository: getIt<UserRepository>() ));

  getIt.registerLazySingleton<ThemeService>(() => ThemeService());
  getIt.registerLazySingleton(() => SettingsCubit(getIt<ThemeService>()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(firestore: getIt<FirebaseFirestore>()));
  getIt.registerLazySingleton(
      () => AuthCubit(authRepository: getIt<AuthRepository>()));
}
