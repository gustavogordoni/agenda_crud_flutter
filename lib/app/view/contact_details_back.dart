import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';

class ContactDetailsBack {
  final BuildContext context;
  late Contact contact;

  ContactDetailsBack(this.context) {
    contact = ModalRoute.of(context)!.settings.arguments as Contact;    
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
