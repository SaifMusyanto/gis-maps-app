import 'package:dartz/dartz.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/features/cv/domain/repositories/cv_repository.dart';

import '../../../../error/exceptions.dart';
import '../../../../util/helper.dart';

class AnalyzeCv implements UseCase<Either<Failure, CvModel>, CvModel> {
  AnalyzeCv(this._repository);

  final CvRepository _repository;

  @override
  Future<Either<Failure, CvModel>> call(CvModel params) {
    return _repository.analyzeCv(params);
  }
}
