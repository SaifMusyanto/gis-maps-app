import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../analysis/analysis_model.dart';

part 'cv_model.freezed.dart';
part 'cv_model.g.dart';

@freezed
@HiveType(typeId: 1)
class CvModel with _$CvModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CvModel({
    @HiveField(0) required String? fileName,
    @HiveField(1) required String? filePath,
    @HiveField(2) required DateTime? createdAt,
    @HiveField(3) required CvPurpose? purpose,
    @HiveField(4) required String? position,
    @HiveField(5) required String? description,
    @HiveField(6) int? overallScore,
    @HiveField(7) AnalysisModel? analysis,
  }) = _CvModel;

  factory CvModel.fromJson(Map<String, Object?> json) => _$CvModelFromJson(json);
}

CvModel generateDummyCvModel() {
  return CvModel(
    fileName: faker.lorem.word(),
    filePath: faker.lorem.word(),
    createdAt: DateTime.now(),
    purpose: CvPurpose.career,
    position: faker.lorem.word(),
    description: faker.lorem.sentence(),
    overallScore: faker.randomGenerator.integer(100),
  );
}

@HiveType(typeId: 2)
enum CvPurpose {
  @HiveField(0)
  career,
  @HiveField(1)
  scholarship,
  @HiveField(2)
  organization,
}

class CvModelAdapter extends TypeAdapter<CvModel> {
  @override
  final int typeId = 1;

  @override
  CvModel read(BinaryReader reader) {
    final map = reader.readMap();
    return CvModel(
      fileName: map[0] as String?,
      filePath: map[1] as String?,
      createdAt: map[2] as DateTime?,
      purpose: map[3] as CvPurpose?,
      position: map[4] as String?,
      description: map[5] as String?,
      overallScore: map[6] as int?,
      analysis: map[7] as AnalysisModel?,
    );
  }

  @override
  void write(BinaryWriter writer, CvModel obj) {
    writer.writeMap({
      0: obj.fileName,
      1: obj.filePath,
      2: obj.createdAt,
      3: obj.purpose,
      4: obj.position,
      5: obj.description,
      6: obj.overallScore,
      7: obj.analysis,
    });
  }
}

class CvPurposeAdapter extends TypeAdapter<CvPurpose> {
  @override
  final int typeId = 2;

  @override
  CvPurpose read(BinaryReader reader) {
    return CvPurpose.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, CvPurpose obj) {
    writer.writeInt(obj.index);
  }
}