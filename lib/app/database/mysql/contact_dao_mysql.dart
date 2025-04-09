import 'dart:convert';
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactDaoMysql implements ContactDAO {  

  @override
  Future<List<Contact>> find() async {
    final urlREST = dotenv.env['API_URL'];
    
    if (urlREST == null || urlREST.isEmpty) {
      throw Exception('API_URL não configurada.');
    }

    final url = Uri.parse(urlREST);

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception(
        'Erro ao buscar contatos. Código: ${response.statusCode}',
      );
    }

    Iterable listDart = json.decode(response.body);

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

  @override
  remove(id) async {
    final urlREST = "${dotenv.env['API_URL']}/$id" ;  
    var uri = Uri.parse(urlREST);
    var response = await http.delete(uri);

    if(response.statusCode != 200) throw Exception('Erro REST API.');
  }

  @override
  save(Contact contact) async{
    final urlREST = dotenv.env['API_URL'];

    if (urlREST == null || urlREST.isEmpty) {
      throw Exception('API_URL não configurada.');
    }

    final url = Uri.parse(urlREST);
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
}
