import 'package:app/src/screens/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/src/screens/base.dart';
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
        theme: FlexThemeData.light(),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.cyanM3),

        // routes
        home: TransactionsScreen(),
      ),
    );
  }
}
