// ignore_for_file: prefer_const_constructors

import 'package:app/src/config/constants.dart';
import 'package:app/src/screens/base.dart';
import 'package:app/src/screens/home_screen.dart';
import 'package:app/src/screens/tradings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class DriverMindApp extends StatelessWidget {
  const DriverMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        color: Theme.of(context).secondaryHeaderColor,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(
            colorScheme: Constants.colorScheme, useMaterial3: true),

        // routes
        home: BaseScreen(),
      ),
    );
  }
}
