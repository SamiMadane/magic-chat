import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicchat/core/themes/manager_dark_theme.dart';
import 'package:magicchat/core/themes/manager_light_theme.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MagicChat extends StatelessWidget {
  final AppRouter appRouter;
  final ThemeMode initialThemeMode;

  const MagicChat({super.key, required this.appRouter, required this.initialThemeMode});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
          child: MaterialApp(
            title: 'MagicChat Starter',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: navigatorKey,
            initialRoute: Routes.onboardingScreen,
            onGenerateRoute: appRouter.generateRoute,
            theme: managerLightThemeData(),
            darkTheme: managerDarkThemeData(),
            themeMode: initialThemeMode,
          ),
        );
      },
    );
  }
}
