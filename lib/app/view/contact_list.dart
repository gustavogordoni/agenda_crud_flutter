import 'package:agenda_crud/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  // ESTABELECENDO A CONEXÃO COM O BANCO DE DADOS
  Future<List<Contact>> _buscar() async {
    return ContactDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro) {
        // CASO JÁ TENHA CARREGADO OS DADOS
        if (futuro.hasData) {
          List<Contact>? listaContatos = futuro.data;

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
                  backgroundImage: NetworkImage(contato.urlAvatar),
                );

                return ListTile(
                  leading: avatar,
                  title: Text(contato.nome),
                  subtitle: Text(contato.telefone),

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
