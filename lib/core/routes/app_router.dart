import 'package:flutter/material.dart';





class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const onBoardingScreen(),
      //   );
     
      default:
        return null;
    }
  }
}
