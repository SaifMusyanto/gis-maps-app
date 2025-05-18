import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gis_maps_app/database/hive_service.dart';
import 'package:meta/meta.dart';

import '../../data/models/cv/cv_model.dart';

part 'cv_event.dart';
part 'cv_state.dart';
part 'cv_bloc.freezed.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  CvBloc() : super(const CvState.initial()) {
    on<_GetHistory>(
      _onGetHistory,
    );
    on<_AddHistory>(
      _onAddHistory,
    );
    on<_DeleteHistory>(
      _onDeleteHistory,
    );
  }

  Future<void> _onGetHistory(_GetHistory event, Emitter<CvState> emit,) async {
    emit(const CvState.loading());
    try {
      final history = HiveService().getAnalysisHistory();
      emit(CvState.loaded(history));
    } catch (e) {
      emit(CvState.error(e.toString()));
    }
  }

  Future<void> _onAddHistory(_AddHistory event, Emitter<CvState> emit) async {
    emit(const CvState.loading());
    try {
      await HiveService().saveAnalysis(event.cv);
      emit(CvState.added());
    } catch (e) {
      emit(CvState.error(e.toString()));
    }
  }

  Future<void> _onDeleteHistory(_DeleteHistory event, Emitter<CvState> emit,) async {
    emit(const CvState.loading());
    try {
      await HiveService().deleteAnalysis(event.cv);
      emit(CvState.deleted());
    } catch (e) {
      emit(CvState.error(e.toString()));
    }
  }
}
