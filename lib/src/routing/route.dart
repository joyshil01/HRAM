import 'package:flutter/material.dart';
import 'package:hrm/src/routing/routeNames.dart';
import '../features/log-in/presentation/loginScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            body: Container(),
          );
        });
    }
  }
}
