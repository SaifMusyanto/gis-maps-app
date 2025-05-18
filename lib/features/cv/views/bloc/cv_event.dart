part of 'cv_bloc.dart';

@freezed
class CvEvent with _$CvEvent {
  const factory CvEvent.started() = _Started;

  const factory CvEvent.getHistory() = _GetHistory;

  const factory CvEvent.addHistory(CvModel cv) =_AddHistory;

  const factory CvEvent.deleteHistory(CvModel cv) = _DeleteHistory;
}