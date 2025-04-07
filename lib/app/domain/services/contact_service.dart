import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDAO>();

  Future<void> save(Contact contact) async {
    validateName(contact.nome);
    validateEmail(contact.email);
    validatePhone(contact.telefone);
    await _dao.save(contact);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  // VALIDAÇÕES NA CAMADA DE DOMÍNIO
  validateName(String name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainLayerException('O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerException(
        'O nome deve ter pelo menos $min caracteres.',
      );
    } else if (name.length > max) {
      throw new DomainLayerException(
        'O nome deve ter no máximo $max caracteres.',
      );
    }
  }

  validateEmail(String email) {
    if (email == null) {
      throw new DomainLayerException('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DomainLayerException('O e-mail deve conter um @.');
    }
  }

  validatePhone(String phone) {
    var format = RegExp(r'^\([0-9]{2}\) [0-9] [0-9]{4}\-[0-9]{4}$');

    if (phone == null) {
      throw new DomainLayerException('O telefone é obrigatório.');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerException(
        'O telefone deve estar no formato (99) 9 9999-9999.',
      );
    }
  }
}
