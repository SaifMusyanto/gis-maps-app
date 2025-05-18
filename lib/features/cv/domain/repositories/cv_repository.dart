import 'package:dartz/dartz.dart';
import '../../../../error/exceptions.dart';
import '../../data/models/cv/cv_model.dart';

abstract class CvRepository {
  Future<Either<Failure, CvModel>> analyzeCv(CvModel cv);
}