import 'package:airapy_assessment/modules/home/repo/home_repo.dart';
import 'package:get_it/get_it.dart';

import 'api_services.dart';
import 'helpers.dart';

GetIt sl = GetIt.instance;

void setUpLocator() {
  sl.registerLazySingleton(() => Helpers());
  sl.registerLazySingleton(() => HttpReq());
  sl.registerLazySingleton(() => HomeRepo());
}
