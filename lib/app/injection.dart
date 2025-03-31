import 'package:agenda_crud/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;
  
  // Outra possibilidade...
  // getIt.registerFactory<ContactDAO>(ContactDAOImpl());

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());

}