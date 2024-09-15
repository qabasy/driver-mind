import 'dart:io';

import 'package:app/src/app.dart';
import 'package:app/src/models/database_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_common_ffi;

void main(List<String> args) {
  if (Platform.isWindows) {
    // Initialize FFI
    sqflite_common_ffi.sqfliteFfiInit();
    // Change the default factory to FFI
    sqflite_common_ffi.databaseFactory = sqflite_common_ffi.databaseFactoryFfi;
  }

  DatabaseHelper.instance.database.then((v) {
    v.getVersion();
  });
  runApp(const DriverMindApp());
}
