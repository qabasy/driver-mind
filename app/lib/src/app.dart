import 'package:app/src/screens/base.dart';
import 'package:app/src/screens/home_screen.dart';
import 'package:app/src/screens/trading_screen.dart';
import 'package:app/src/screens/transactions_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class DriverMindApp extends StatelessWidget {
  const DriverMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        color: Theme.of(context).secondaryHeaderColor,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(scheme: FlexScheme.sakura).copyWith(
          scaffoldBackgroundColor: Theme.of(context).secondaryHeaderColor,
          // appBarTheme: Theme.of(context).appBarTheme.copyWith(
          //       // backgroundColor: Theme.of(context).hoverColor,
          //       color: Theme.of(context).secondaryHeaderColor,
          //       // titleTextStyle:
          //     ),
        ),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.cyanM3),

        // routes
        home: BaseScreen(),
      ),
    );
  }
}
