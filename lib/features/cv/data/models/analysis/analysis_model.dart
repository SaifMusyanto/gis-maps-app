import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gis_maps_app/features/cv/data/models/analysis_aspect/analysis_aspect_model.dart';
import 'package:hive/hive.dart';

part 'analysis_model.freezed.dart';
part 'analysis_model.g.dart';

@freezed
@HiveType(typeId: 3)
class AnalysisModel with _$AnalysisModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AnalysisModel({
    @HiveField(0) required String overview,
    @HiveField(1) required List<String> recommendedKeywords,
    @HiveField(2) required AnalysisAspectModel experiences,
    @HiveField(3) required AnalysisAspectModel skills,
    @HiveField(4) required AnalysisAspectModel formatting,
    @HiveField(5) required AnalysisAspectModel education,
    @HiveField(6) required AnalysisAspectModel atsFriendly,
  }) = _AnalysisModel;

  factory AnalysisModel.fromJson(Map<String, Object?> json) => _$AnalysisModelFromJson(json);
}

class AnalysisModelAdapter extends TypeAdapter<AnalysisModel> {
  @override
  final int typeId = 3;

  @override
  AnalysisModel read(BinaryReader reader) {
    final map = reader.readMap();
    return AnalysisModel(
      overview: map[0] as String,
      recommendedKeywords: List<String>.from(map[1] as List),
      experiences: map[2] as AnalysisAspectModel,
      skills: map[3] as AnalysisAspectModel,
      formatting: map[4] as AnalysisAspectModel,
      education: map[5] as AnalysisAspectModel,
      atsFriendly: map[6] as AnalysisAspectModel,
    );
  }

  @override
  void write(BinaryWriter writer, AnalysisModel obj) {
    writer.writeMap({
      0: obj.overview,
      1: obj.recommendedKeywords,
      2: obj.experiences,
      3: obj.skills,
      4: obj.formatting,
      5: obj.education,
      6: obj.atsFriendly,
    });
  }
}