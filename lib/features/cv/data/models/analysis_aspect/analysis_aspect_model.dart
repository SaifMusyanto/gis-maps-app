import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'analysis_aspect_model.freezed.dart';
part 'analysis_aspect_model.g.dart';

@freezed
@HiveType(typeId: 4)
class AnalysisAspectModel with _$AnalysisAspectModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AnalysisAspectModel({
    @HiveField(0) required int? score,
    @HiveField(1) required String analysis,
    @HiveField(2) required List<String> improvements,
    @HiveField(3) required List<String> corrections,
  }) = _AnalysisAspectModel;

  factory AnalysisAspectModel.fromJson(Map<String, Object?> json)
  => _$AnalysisAspectModelFromJson(json);
}

class AnalysisAspectModelAdapter extends TypeAdapter<AnalysisAspectModel> {
  @override
  final int typeId = 4;

  @override
  AnalysisAspectModel read(BinaryReader reader) {
    final map = reader.readMap();
    return AnalysisAspectModel(
      score: map[0] as int?,
      analysis: map[1] as String,
      improvements: List<String>.from(map[2] as List),
      corrections: List<String>.from(map[3] as List),
    );
  }

  @override
  void write(BinaryWriter writer, AnalysisAspectModel obj) {
    writer.writeMap({
      0: obj.score,
      1: obj.analysis,
      2: obj.improvements,
      3: obj.corrections,
    });
  }
}