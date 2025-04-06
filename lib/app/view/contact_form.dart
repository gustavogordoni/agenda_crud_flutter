import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  // Component input name
  Widget fieldName() {
    return TextFormField(decoration: InputDecoration(labelText: 'Nome:'));
  }

  // Component input email
  Widget fieldEmail() {
    return TextFormField(decoration: InputDecoration(labelText: 'E-mail:'));
  }

  // Component input phone
  Widget fieldPhone() {
    var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) # ####-####',
    );

    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [maskFormatter],
      decoration: InputDecoration(
        labelText: 'Telefone:',
        hintText: '(99) 9 9999-9999',
      ),
    );
  }

  // Component input url image
  Widget fieldUrlImage() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Endereço da foto:',
        hintText: 'http://www.site.com',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              fieldName(),
              fieldEmail(),
              fieldPhone(),
              fieldUrlImage(),
            ],
          ),
        ),
      ),
    );
  }
}
