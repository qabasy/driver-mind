// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:app/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/src/screens/base.dart';
import 'package:app/src/config/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class DriverMindApp extends StatefulWidget {
  const DriverMindApp({super.key});

  @override
  State<DriverMindApp> createState() => _DriverMindAppState();
}

class _DriverMindAppState extends State<DriverMindApp> {
  Future<PermissionStatus> status() async {
    return await Permission.manageExternalStorage.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          ), // Replace with your home page
        );
      },
    );
    // if (await status() != PermissionStatus.granted) {
    //   await Fluttertoast.showToast(msg: "Access Denied");
    // }
  }

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
