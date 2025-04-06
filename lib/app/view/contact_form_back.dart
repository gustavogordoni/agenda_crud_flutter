import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store{
  late Contact contact;

  // Diferenciar INSERT do UPDATE
  _ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    contact = (parameter == null) ? Contact.empty() : parameter as Contact;
  }

  // Salvar


  // Validações fromt-end
}