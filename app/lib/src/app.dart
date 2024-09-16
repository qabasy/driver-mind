// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app/src/screens/base.dart';
import 'package:app/src/config/constants.dart';

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
