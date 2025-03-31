import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final listaContatos = [
    {
      'nome': 'Pietro',
      'telefone': '(19) 9 9874-6565',
      'avatar': 'https://www.w3schools.com/howto/img_avatar.png',
    },
    {
      'nome': 'Maria',
      'telefone': '(11) 9 9813-1565',
      'avatar': 'https://www.w3schools.com/howto/img_avatar.png',
    },
    {
      'nome': 'Joao',
      'telefone': '(17) 9 9889-5654',
      'avatar': 'https://www.w3schools.com/howto/img_avatar.png',
    },
    {
      'nome': 'Pedro',
      'telefone': '(11) 9 9883-5256',
      'avatar': 'https://www.w3schools.com/howto/img_avatar.png',
    },
    {
      'nome': 'Paulo',
      'telefone': '(11) 9 9579-1566',
      'avatar': 'https://www.w3schools.com/howto/img_avatar.png',
    },
    {
      'nome': 'Joana',
      'telefone': '(17) 9 9843-5731',
      'avatar': 'https://www.w3schools.com/howto/img_avatar.png',
    },
  ];

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
      body: ListView.builder(
        itemCount: listaContatos.length,
        itemBuilder: (context, index) {
          var contato = listaContatos[index];
          var avatar = CircleAvatar(
            backgroundImage: NetworkImage(contato['avatar']!),
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
  }
}
