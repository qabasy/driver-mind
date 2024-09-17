// import 'dart:io';

import 'package:app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main(List<String> args) async {
  // if (Platform.isWindows) {
  //   // Initialize FFI
  //   sqflite_common_ffi.sqfliteFfiInit();
  //   // Change the default factory to FFI
  //   sqflite_common_ffi.databaseFactory = sqflite_common_ffi.databaseFactoryFfi;
  // }

  // await Permission.systemAlertWindow.request();
  // await Permission.criticalAlerts.request();
  

  runApp(const DriverMindApp());
  // await Permission.storage.request().then((value) {
  //   if (!(value == PermissionStatus.denied ||
  //       value == PermissionStatus.permanentlyDenied)) {
  // }
  // });
}
