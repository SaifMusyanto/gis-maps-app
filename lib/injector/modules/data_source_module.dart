import 'package:gis_maps_app/features/cv/data/data_sources/cv_data_source.dart';

import '../injector.dart';

class DataSourceModule {
  DataSourceModule._();

  static void init() {
    Injector.instance
      .registerLazySingleton<CvDataSource>(
        CvDataSourceImpl.new,
      );
  }
}
