import 'package:agenda_crud/app/database/firestore/contact_dao_firestore.dart';
import 'package:agenda_crud/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;
  
  // Outra possibilidade...
  // getIt.registerFactory<ContactDAO>(ContactDAOImpl());

  // Injeção de Dependência do SqLite
  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());

  // Injeção de Dependência do Firestore
  // getIt.registerSingleton<ContactDAO>(ContactDAOFirestore());

  getIt.registerSingleton<ContactService>(ContactService());

}