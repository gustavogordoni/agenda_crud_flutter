import 'package:agenda_crud/app/database/script.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {

  Future<List<Map<String, dynamic>>> _buscar() async {
    String path = join(await getDatabasesPath(), 'agenda_db');
    
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(createTable);
        await db.execute(insertValues);
      },
    );

    List<Map<String, dynamic>> resultado = await db.query('contact');

    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro) {
        // CASO JÁ TENHA CARREGADO OS DADOS
        if (futuro.hasData) {
          var listaContatos = futuro.data;

          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Contatos'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                  },
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: listaContatos!.length,
              itemBuilder: (context, index) {
                var contato = listaContatos[index];
                var avatar = CircleAvatar(
                  backgroundImage: NetworkImage(contato['url_avatar']!),
                );

                return ListTile(
                  leading: avatar,
                  title: Text(contato['nome']!),
                  subtitle: Text(contato['telefone']!),

                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                        IconButton(icon: Icon(Icons.delete), onPressed: null),
                      ],
                    ),
                  ),
                );
              },
            ),
          );

          // CASO NÃO TENHA CARREGADO OS DADOS
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}