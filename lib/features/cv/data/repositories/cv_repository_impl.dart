import 'package:dartz/dartz.dart';
import 'package:gis_maps_app/features/cv/data/models/analysis/analysis_model.dart';

import '../../../../error/exceptions.dart';
import '../../../../util/helper.dart';
import '../../domain/repositories/cv_repository.dart';
import '../data_sources/cv_data_source.dart';
import '../models/cv/cv_model.dart';

class CvRepositoryImpl implements CvRepository {
  final CvDataSource dataSource;

  const CvRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CvModel>> analyzeCv(CvModel cv) async {
    return safeCall(() => dataSource.analyzeCv(cv));
  }
}
