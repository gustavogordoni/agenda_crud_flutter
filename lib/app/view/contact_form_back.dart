import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store {
  @observable
  late Contact contact;
  var _service = GetIt.I.get<ContactService>();
  // Atributos de controle
  bool _nameIsValid = false;
  bool _emailIsValid = false;
  bool _phoneIsValid = false;

  @computed
  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  // Diferenciar INSERT do UPDATE

  _ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    // contact = (parameter == null) ? Contact : parameter as Contact;
    contact = (parameter == null) ? Contact.empty() : parameter as Contact;
  }

  // Salvar
  save() async {
    await _service.save(contact);
  }

  // Validações front-end ------------------------------------------------

  // Validação nome
  String? validateName(String? name) {
    try {
      _service.validateName(name ?? '');
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  // Validação email
  String? validateEmail(String? email) {
    try {
      _service.validateEmail(email ?? '');
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  // Validação telefone
  String? validatePhone(String? phone) {
    try {
      _service.validatePhone(phone ?? '');
      _phoneIsValid = true;
      return null;
    } catch (e) {
      _phoneIsValid = false;
      return e.toString();
    }
  }
}
