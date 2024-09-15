import 'package:app/src/screens/home_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class DriverMindApp extends StatelessWidget {
  const DriverMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(scheme: FlexScheme.cyanM3),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.cyanM3),
        // routes
        home: const HomeScreen(),
      ),
    );
  }
}
