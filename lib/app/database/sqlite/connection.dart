import 'package:agenda_crud/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;


  static Future<Database> get() async {
    // CASO NÃO TENHA CRIADO A CONEXÃO
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'agenda_db');

      // deleteDatabase(path);

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          db.execute(createTable);
          db.execute(insertValues);
        },
      );
      return _db!;

      // CASO TENHA CRIADO A CONEXÃO
    } else {
      return _db!;
    }
  }
}
