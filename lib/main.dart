import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:agenda_crud/app/injection.dart';
import 'package:agenda_crud/firebase_options.dart';
import 'package:agenda_crud/app/database/firestore/seed_contact.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  
  // Plataforma Desktop: SQLite
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  // Plataforma Mobile: Firestore
  if (Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await seedContacts();
  }

  await setupInjection();
  runApp(MyApp());
}