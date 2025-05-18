import '../../features/cv/views/bloc/cv_bloc.dart';
import '../injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    Injector.instance
      .registerLazySingleton<CvBloc>(
        CvBloc.new,
      );
  }
}
