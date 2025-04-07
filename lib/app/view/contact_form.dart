import 'package:agenda_crud/app/view/contact_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  // Component input name
  Widget fieldName(ContactFormBack back) {
    return TextFormField(
      validator: back.validateName,
      onSaved: (newValue) => back.contact.nome = newValue ?? '',
      initialValue: back.contact.nome,
      decoration: InputDecoration(labelText: 'Nome:'),
    );
  }

  // Component input email
  Widget fieldEmail(ContactFormBack back) {
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (newValue) => back.contact.email = newValue ?? '',
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

      validator: back.validatePhone,
      onSaved: (newValue) => back.contact.telefone = newValue ?? '',
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
      onSaved: (newValue) => back.contact.urlAvatar = newValue ?? '',
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
        actions: [
          IconButton(
            onPressed: () async {
              if (_form.currentState?.validate() ?? false) {
                _form.currentState?.save();
                if (_back.isValid) {
                  try {
                    await _back.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Contato salvo com sucesso!')),
                    );
                    Navigator.of(context).pop();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erro ao salvar: $e')),
                    );
                  }
                }
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
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
