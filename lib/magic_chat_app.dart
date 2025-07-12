import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resourses/colors_manager.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';


class MagicChat extends StatelessWidget {
  final AppRouter appRouter;
  const MagicChat({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.height.h, MediaQuery.of(context).size.width.w),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'MagicChat Starter',
        theme: ThemeData(
          primaryColor: ColorsManager.primaryColor,
          scaffoldBackgroundColor: ColorsManager.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      )
    );
  }
}

