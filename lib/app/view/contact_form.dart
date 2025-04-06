import 'package:agenda_crud/app/view/contact_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  // Component input name
  Widget fieldName(ContactFormBack back) {
    return TextFormField(
      initialValue: back.contact.nome,
      decoration: InputDecoration(labelText: 'Nome:'),
    );
  }

  // Component input email
  Widget fieldEmail(ContactFormBack back) {
    return TextFormField(
      initialValue: back.contact.email,
      decoration: InputDecoration(labelText: 'E-mail:'),
    );
  }

  // Component input phone
  Widget fieldPhone(ContactFormBack back) {
    var maskFormatter = new MaskTextInputFormatter(mask: '(##) # ####-####');

    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [maskFormatter],

      initialValue: back.contact.telefone,
      decoration: InputDecoration(
        labelText: 'Telefone:',
        hintText: '(99) 9 9999-9999',
      ),
    );
  }

  // Component input url image
  Widget fieldUrlImage(ContactFormBack back) {
    return TextFormField(
      initialValue: back.contact.urlAvatar,
      decoration: InputDecoration(
        labelText: 'Endereço da foto:',
        hintText: 'http://www.site.com',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contato'),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              fieldName(_back),
              fieldEmail(_back),
              fieldPhone(_back),
              fieldUrlImage(_back),
            ],
          ),
        ),
      ),
    );
  }
}
