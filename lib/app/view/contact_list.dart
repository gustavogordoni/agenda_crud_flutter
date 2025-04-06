import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:agenda_crud/app/view/contact_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  final _back = ContactListBack();

  // Component circleAvatar
  CircleAvatar circleAvatar(String url) {
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  // Component edit button

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
      icon: Icon(Icons.edit),
      color: Colors.orange,
      onPressed: onPressed,
    );
  }

  // Component remove button
  Widget iconRemoveButton(BuildContext context, VoidCallback remove) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text('Excluir'),
                content: Text('Confirma a exclusão?'),
                actions: [
                  TextButton(
                    child: Text('Não'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(child: Text('Sim'), onPressed: remove),
                ],
              ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: Observer(
        builder: (context) {
          return FutureBuilder(
            future: _back.list,
            builder: (context, futuro) {
              if (!futuro.hasData) {
                // CASO NÃO TENHA CARREGADO OS DADOS
                return Scaffold(body: Center(child: CircularProgressIndicator()));
              } else {
                // CASO TENHA CARREGADO OS DADOS
                List<Contact>? listaContatos = futuro.data;

                return ListView.builder(
                  itemCount: listaContatos!.length,
                  itemBuilder: (context, index) {
                    var contato = listaContatos[index];

                    return ListTile(
                      leading: circleAvatar(contato.urlAvatar),
                      title: Text(contato.nome),
                      subtitle: Text(contato.telefone),

                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            iconEditButton(() {
                              _back.goToForm(context, contato);
                            }),
                            iconRemoveButton(context, () {
                              _back.remove(contato.id);
                              Navigator.of(context).pop();
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
