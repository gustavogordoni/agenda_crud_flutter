class Contact {
  int id;
  String nome;
  String telefone;
  String email;
  String urlAvatar;

  // ENCAPSULAMENTO
  // int get id => _id;
  // String get nome => _nome;
  // String get telefone => _telefone;
  // String get email => _email;
  // String get urlAvatar => _urlAvatar;

  Contact({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.urlAvatar,
  });

  Contact.empty()
    : id = 0,
      nome = '',
      telefone = '',
      email = '',
      urlAvatar = '';
}
