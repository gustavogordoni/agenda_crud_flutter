import 'package:agenda_crud/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      final path = join(await getDatabasesPath(), 'agenda_db.db');

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(createTable);
          await db.execute(insertValues);
        },
      );
    }

    return _db!;
  }
}
