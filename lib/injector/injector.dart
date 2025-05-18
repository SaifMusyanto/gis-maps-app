import 'package:get_it/get_it.dart';

import 'modules/bloc_module.dart';
import 'modules/data_source_module.dart';
import 'modules/repository_module.dart';
import 'modules/use_cases_module.dart';

class Injector {
  Injector._();

  static GetIt instance = GetIt.instance;

  static void init() {
    RepositoryModule.init();
    BlocModule.init();
    DataSourceModule.init();
    UseCasesModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
