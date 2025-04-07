import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/view/contact_details_back.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  
  showModalError(BuildContext context){
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um App compatível'),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
  

  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var widht = constraints.biggest.width;
        var height = constraints.biggest.height;
        var radius = widht / 3;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(contact.urlAvatar)!.isAbsolute)
                  ? CircleAvatar(
                    radius: radius,
                    backgroundImage: NetworkImage(contact.urlAvatar),
                  )
                  : CircleAvatar(
                    radius: radius,
                    child: Icon(size: widht / 2, Icons.person),
                  ),

              Center(
                child: Text('${contact.nome}', style: TextStyle(fontSize: 30)),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone'),
                  subtitle: Text('${contact.telefone}'),
                  trailing: Container(
                    width: widht / 4,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.message, color: Colors.blue),
                          onPressed:
                              () => _back.lauchSMS(showModalError),
                                  
                        ),
                        IconButton(
                          icon: Icon(Icons.phone, color: Colors.blue),
                          onPressed:
                              () =>
                                  _back.lauchPhone(showModalError),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('E-mail'),
                  subtitle: Text('${contact.email}'),
                  onTap: () => _back.lauchEmail(showModalError),
                ),
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
