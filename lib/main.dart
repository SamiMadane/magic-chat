import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicchat/core/di/dependency_injection.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';
import 'package:magicchat/firebase_options.dart';
import 'package:magicchat/magic_chat_app.dart';
import 'core/routes/app_router.dart' hide getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  setupGetIt();


  final localeCode = await SharedPrefHelper.getLocale();
  final startLocale = Locale(localeCode);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang',
      fallbackLocale: const Locale('en'),
      startLocale: startLocale,
      ignorePluralRules: false,
      child: BlocProvider(
        create: (context) => getIt<SettingsCubit>()..loadSettings()..loadSettings(),
        child: MagicChat(
          appRouter: AppRouter(),
        ),
      ),
    ),
  );
}
