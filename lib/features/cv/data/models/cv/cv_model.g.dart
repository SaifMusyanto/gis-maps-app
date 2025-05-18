// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CvModelImpl _$$CvModelImplFromJson(Map<String, dynamic> json) =>
    _$CvModelImpl(
      fileName: json['file_name'] as String?,
      filePath: json['file_path'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      purpose: $enumDecodeNullable(_$CvPurposeEnumMap, json['purpose']),
      position: json['position'] as String?,
      description: json['description'] as String?,
      overallScore: (json['overall_score'] as num?)?.toInt(),
      analysis: json['analysis'] == null
          ? null
          : AnalysisModel.fromJson(json['analysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CvModelImplToJson(_$CvModelImpl instance) =>
    <String, dynamic>{
      'file_name': instance.fileName,
      'file_path': instance.filePath,
      'created_at': instance.createdAt?.toIso8601String(),
      'purpose': _$CvPurposeEnumMap[instance.purpose],
      'position': instance.position,
      'description': instance.description,
      'overall_score': instance.overallScore,
      'analysis': instance.analysis,
    };

const _$CvPurposeEnumMap = {
  CvPurpose.career: 'career',
  CvPurpose.scholarship: 'scholarship',
  CvPurpose.organization: 'organization',
};
