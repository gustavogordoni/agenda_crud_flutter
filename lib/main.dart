import 'dart:io';

import 'package:agenda_crud/app/injection.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:agenda_crud/app/my_app.dart';


void main() {
  
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  setupInjection();
  runApp(MyApp());
}