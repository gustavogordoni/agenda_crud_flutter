import 'package:agenda_crud/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;
  
  // Outra possibilidade...
  // getIt.registerFactory<ContactDAO>(ContactDAOImpl());

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());

}