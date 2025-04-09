import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:agenda_crud/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/app/database/firestore/contact_dao_firestore.dart';
import 'package:agenda_crud/app/database/mysql/contact_dao_mysql.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';

Future<void> setupInjection() async {  
  
  final useRestAPI = await isAPIOnline();

  if (useRestAPI) {
    // Identificou REST API ATIVA
    GetIt.I.registerSingleton<ContactDAO>(ContactDaoMysql());    
    print("Base de Dados: REST API com MySQL");
  } else {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Plataforma Desktop: SQLite
      GetIt.I.registerSingleton<ContactDAO>(ContactDAOImpl());      
      print("Base de Dados: SQLite");
    } else {
      // Plataforma Mobile: Firestore
      GetIt.I.registerSingleton<ContactDAO>(ContactDAOFirestore());      
      print("Base de Dados: Firestore");
    }
  }

  GetIt.I.registerSingleton<ContactService>(ContactService());
}

// Verifica se REST API está funcionando
Future<bool> isAPIOnline() async {
  final urlString = dotenv.env['API_URL'];
  if (urlString == null || urlString.isEmpty) return false;

  try {
    final response = await http.get(Uri.parse(urlString));
    return response.statusCode == 200;

  } catch (_) {
    return false;
  }
}
