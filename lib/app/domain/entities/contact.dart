class Contact {
  dynamic? id;
  String nome;
  String telefone;
  String email;
  String urlAvatar;

  Contact({
    this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.urlAvatar,
  });

  Contact.empty()
    : id = null,
      nome = '',
      telefone = '',
      email = '',
      urlAvatar = '';
}
