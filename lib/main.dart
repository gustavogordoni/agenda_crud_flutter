import 'dart:convert';
import 'dart:io';
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:agenda_crud/app/my_app.dart';
import 'package:agenda_crud/app/injection.dart';
import 'package:agenda_crud/firebase_options.dart';
import 'package:agenda_crud/app/database/firestore/seed_contact.dart';

void main() async {
  await dotenv.load();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await seedContacts();
  }

  // var contact = Contact(
  //   nome: 'Joaquim',
  //   telefone: '(17) 9 99999-9999',
  //   email: 'joaquim@email.com',
  //   urlAvatar: '',
  // );

  // await salvar(contact);

  // excluir(1);

  // var list = await buscar();
  // for (var item in list){
  //   print(item.nome);
  // }

  setupInjection();
  runApp(MyApp());
}

Future<List<Contact>> buscar() async {
  final urlString = dotenv.env['API_URL'];
  if (urlString == null || urlString.isEmpty)
    throw Exception('API_URL não configurada.');

  final url = Uri.parse(urlString);

  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Erro ao buscar contatos. Código: ${response.statusCode}');
  }

  final listDart = json.decode(response.body);

  return List<Contact>.from(
    listDart.map(
      (item) => Contact(
        id: item['id'],
        nome: item['nome'],
        telefone: item['telefone'],
        email: item['email'],
        urlAvatar: item['urlAvatar'],
      ),
    ),
  );
}

Future<void> salvar(Contact contact) async {
  final urlString = dotenv.env['API_URL'];

  if (urlString == null || urlString.isEmpty)
    throw Exception('API_URL não configurada.');

  final url = Uri.parse(urlString);
  final headers = {'Content-Type': 'application/json'};
  final contactJson = json.encode({
    'id': contact.id,
    'nome': contact.nome,
    'telefone': contact.telefone,
    'email': contact.email,
    'urlAvatar': contact.urlAvatar,
  });

  late http.Response response;

  if (contact.id == null) {
    response = await http.post(url, headers: headers, body: contactJson);
  } else {
    response = await http.put(url, headers: headers, body: contactJson);
  }

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception('Erro ao salvar contato. Código: ${response.statusCode}');
  }
}

excluir(int id) async{
  final urlString = "${dotenv.env['API_URL']}/$id" ;  
  var uri = Uri.parse(urlString);
  var resposta = await http.delete(uri);

  if(resposta.statusCode != 200) throw Exception('Erro REST API.');
}
