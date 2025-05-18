part of 'cv_bloc.dart';

@freezed
class CvState with _$CvState {
  const factory CvState.initial() = _Initial;
  const factory CvState.loading() = _Loading;
  const factory CvState.loaded(List<CvModel> history) = _Loaded;
  const factory CvState.added() = _Added;
  const factory CvState.deleted() = _Deleted;
  const factory CvState.error(String message) = _Error;
}