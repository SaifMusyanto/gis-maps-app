// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_aspect_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisAspectModelImpl _$$AnalysisAspectModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalysisAspectModelImpl(
      score: (json['score'] as num?)?.toInt(),
      analysis: json['analysis'] as String,
      improvements: (json['improvements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      corrections: (json['corrections'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AnalysisAspectModelImplToJson(
        _$AnalysisAspectModelImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'analysis': instance.analysis,
      'improvements': instance.improvements,
      'corrections': instance.corrections,
    };
