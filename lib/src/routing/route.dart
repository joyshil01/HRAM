// ignore_for_file: unreachable_switch_case

import 'package:flutter/material.dart';
import 'package:hrm/src/routing/routeNames.dart';
import '../features/formDefinitions/presentation/formDefinitionDetails.dart';
import '../features/formDefinitions/presentation/formDefinitionScreen.dart';
import '../features/log-in/presentation/loginScreen.dart';
import '../features/mainPage/presentation/mainScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

      case RouteNames.formDefinition:
        return MaterialPageRoute(
          builder: (BuildContext context) => const FormDefinitionScreen(),
        );

      case RouteNames.formDefinition:
        // final formData = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              // DashboardDetails(formData: formData),
              FormDefinitionDetails(),
        );

      case RouteNames.mainScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainScreen(),
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
