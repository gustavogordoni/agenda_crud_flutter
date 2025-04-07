import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> seedContacts() async {
  final collection = FirebaseFirestore.instance.collection('contacts');

  final contacts = {
    'pietro': {
      'nome': 'Pietro',
      'telefone': '(19) 9 9874-6565',
      'email': 'pietro@email.com',
      'urlAvatar': 'https://i.pravatar.cc/150?img=10',
    },
    'maria': {
      'nome': 'Maria',
      'telefone': '(11) 9 9813-1565',
      'email': 'maria@email.com',
      'urlAvatar': 'https://i.pravatar.cc/150?img=20',
    },
    'joao': {
      'nome': 'João',
      'telefone': '(17) 9 9889-5654',
      'email': 'joao@email.com',
      'urlAvatar': 'https://i.pravatar.cc/150?img=30',
    },
    'pedro': {
      'nome': 'Pedro',
      'telefone': '(11) 9 9883-5256',
      'email': 'pedro@email.com',
      'urlAvatar': 'https://i.pravatar.cc/150?img=40',
    },
    'paulo': {
      'nome': 'Paulo',
      'telefone': '(11) 9 9579-1566',
      'email': 'paulo@email.com',
      'urlAvatar': 'https://i.pravatar.cc/150?img=50',
    },
    'joana': {
      'nome': 'Joana',
      'telefone': '(17) 9 9843-5731',
      'email': 'joana@email.com',
      'urlAvatar': 'https://i.pravatar.cc/150?img=60',
    },
  };

  for (final entry in contacts.entries) {
    await collection.doc(entry.key).set(entry.value);
  }
}
