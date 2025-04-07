  import 'dart:io';

  import 'package:agenda_crud/app/database/firestore/seed_contact.dart';
import 'package:agenda_crud/firebase_options.dart';
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
    } else {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await seedContacts();
    }

    setupInjection();
    runApp(MyApp());
  }
