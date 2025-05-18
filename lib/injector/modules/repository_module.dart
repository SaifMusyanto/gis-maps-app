import 'package:gis_maps_app/features/cv/data/data_sources/cv_data_source.dart';
import 'package:gis_maps_app/features/cv/data/repositories/cv_repository_impl.dart';
import 'package:gis_maps_app/features/cv/domain/repositories/cv_repository.dart';

import '../injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    Injector.instance
      .registerFactory<CvRepository>(
            () => CvRepositoryImpl(
          Injector.instance<CvDataSource>(),
        ),
      );
  }
}
