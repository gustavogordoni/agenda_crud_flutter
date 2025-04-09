import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsBack {
  final BuildContext context;
  late Contact contact;

  ContactDetailsBack(this.context) {
    contact = ModalRoute.of(context)!.settings.arguments as Contact;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    final uri = Uri.parse(url);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        showModalError(context);
      }
    } catch (_) {
      showModalError(context);
    }
  }

  lauchPhone(Function(BuildContext context) showModalError) {
    _launchApp('tel:${contact.telefone}', showModalError);
  }

  lauchSMS(Function(BuildContext context) showModalError) {
    _launchApp('sms:${contact.telefone}', showModalError);
  }

  lauchEmail(Function(BuildContext context) showModalError) {
    _launchApp('mailto:${contact.email}', showModalError);
  }
}
