import 'package:flutter/material.dart';
import 'package:hrm/src/theme/systemTheme.dart';
import 'src/routing/route.dart';
import 'src/routing/routeNames.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
      onGenerateTitle: (BuildContext context) => 'HRM',
    );
  }
}
