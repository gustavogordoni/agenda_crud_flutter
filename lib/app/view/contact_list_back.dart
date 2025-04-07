import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:agenda_crud/app/domain/entities/contact.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

  @observable
  // Lista de contatos
  late Future<List<Contact>> list;

  // Método para atualizar a lista
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  // Método para chamar o form salvar/alterar contato
  goToForm(BuildContext context, [Contact? contact]) {
    Navigator.of(
      context,
    ).pushNamed(MyApp.CONTACT_FORM, arguments: contact).then(refreshList);
  }

  goToDetails(BuildContext context) {
    Navigator.of(context,).pushNamed(MyApp.CONTACT_DETAILS);
  }

  // Método para excluir um contato
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
