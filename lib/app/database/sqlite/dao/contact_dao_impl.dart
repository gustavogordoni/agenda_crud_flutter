import 'package:agenda_crud/app/database/sqlite/connection.dart';
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ContactDAOImpl implements ContactDAO {
  late Database _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('contact');

    return resultado
        .map(
          (linha) => Contact(
            id: linha['id'],
            nome: linha['nome'],
            telefone: linha['telefone'],
            email: linha['email'],
            urlAvatar: linha['url_avatar'],
          ),
        )
        .toList();
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM contact WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Contact contact) async {
    _db = await Connection.get();

    var sql;
    // INSERÇÃO caso o id seja nulo
    if (contact.id == null) {
      sql =
          'INSERT INTO contact (nome, telefone, email, url_avatar) VALUES (?, ?, ?, ?)';
      _db.rawInsert(sql, [
        contact.nome,
        contact.telefone,
        contact.email,
        contact.urlAvatar,
      ]);

      // ATUALIZAÇÃO caso o id diferente de nulo
    } else {
      sql =
          'UPDATE contact SET nome = ?, telefone = ?, email = ?, url_avatar = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        contact.nome,
        contact.telefone,
        contact.email,
        contact.urlAvatar,
        contact.id,
      ]);
    }
  }
}
