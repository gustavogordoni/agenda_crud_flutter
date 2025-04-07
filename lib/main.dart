import 'dart:io';

import 'package:agenda_crud/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agenda_crud/app/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:agenda_crud/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupInjection();
  runApp(MyApp());
  
  FirebaseFirestore.instance.collection('contact').doc().set({
    'name': 'Gustavo',
    'phone': '(11) 9 999-999',
    'email': 'H4a0f@example.com',
  });
}

