import 'package:gis_maps_app/features/cv/domain/repositories/cv_repository.dart';
import 'package:gis_maps_app/features/cv/domain/usecases/analyze_cv.dart';

import '../injector.dart';

class UseCasesModule {
  UseCasesModule._();

  static void init() {
    // CV Use Cases
    Injector.instance
      .registerLazySingleton<AnalyzeCv>(
            () => AnalyzeCv(
          Injector.instance<CvRepository>(),
        ),
      );
  }
}
