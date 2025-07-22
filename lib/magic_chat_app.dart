import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicchat/core/themes/manager_dark_theme.dart';
import 'package:magicchat/core/themes/manager_light_theme.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_state.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MagicChat extends StatelessWidget {
  final AppRouter appRouter;

  const MagicChat({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {

              final theme = state is SettingsSuccess
                  ? (state.theme == 'dark' ? ThemeMode.dark : ThemeMode.light)
                  : ThemeMode.system;

              final locale = (state is SettingsSuccess)
                  ? Locale(state.locale)
                  : context.locale;
                return MaterialApp(
                  title: 'MagicChat Starter',
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: locale,
                  navigatorKey: navigatorKey,
                  initialRoute: Routes.onboardingScreen,
                  onGenerateRoute: appRouter.generateRoute,
                  theme: managerLightThemeData(),
                  darkTheme: managerDarkThemeData(),
                  themeMode: theme,
                );
             
            },
          ),
        );
      },
    );
  }
}
