import 'package:flutter/material.dart';
import 'package:hrm/src/routing/routeNames.dart';
import '../features/dashBoard/presentation/dashboardDetails.dart';
import '../features/dashBoard/presentation/dashboardScreen.dart';
import '../features/log-in/presentation/loginScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

      case RouteNames.dashBoard:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DashboardScreen(),
        );

      case RouteNames.dashBoardDetails:
        final formData = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              DashboardDetails(formData: formData),
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
