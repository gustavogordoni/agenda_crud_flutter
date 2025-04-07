import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactDAOFirestore implements ContactDAO {
  late CollectionReference contactCollection;

  ContactDAOFirestore() {
    contactCollection = FirebaseFirestore.instance.collection('contacts');
  }

  @override
  Future<List<Contact>> find() async {
    var result = await contactCollection.get();
    return result.docs
        .map(
          (doc) => Contact(
            id: doc.reference.id.toString(),
            nome: doc['nome'],
            email: doc['email'],
            telefone: doc['telefone'],
            urlAvatar: doc['urlAvatar'],
          ),
        )
        .toList();
  }

  @override
  remove(id) {
    contactCollection.doc(id).delete();
  }

  @override
  save(Contact contact) {
    contactCollection.doc(contact.id).set({
      'nome': contact.nome,
      'telefone': contact.telefone,
      'email': contact.email,
      'urlAvatar': contact.urlAvatar,
    });
  }
}
