import 'package:flutter/material.dart';
import 'package:hrm/src/theme/systemTheme.dart';
import 'package:provider/provider.dart';
import 'src/features/formDefinitions/data/formDefinitionController.dart';
import 'src/routing/route.dart';
import 'src/routing/routeNames.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FormDataProvider()),
        // ChangeNotifierProvider(create: (context) => JsonDataProvider()),
      ],
      child: MaterialApp(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.bottomNav,
        onGenerateRoute: Routes.generateRoute,
        onGenerateTitle: (BuildContext context) => 'WAZO',
      ),
    );
  }
}
