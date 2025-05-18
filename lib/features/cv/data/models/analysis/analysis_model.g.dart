// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisModelImpl _$$AnalysisModelImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisModelImpl(
      overview: json['overview'] as String,
      recommendedKeywords: (json['recommended_keywords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      experiences: AnalysisAspectModel.fromJson(
          json['experiences'] as Map<String, dynamic>),
      skills:
          AnalysisAspectModel.fromJson(json['skills'] as Map<String, dynamic>),
      formatting: AnalysisAspectModel.fromJson(
          json['formatting'] as Map<String, dynamic>),
      education: AnalysisAspectModel.fromJson(
          json['education'] as Map<String, dynamic>),
      atsFriendly: AnalysisAspectModel.fromJson(
          json['ats_friendly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnalysisModelImplToJson(_$AnalysisModelImpl instance) =>
    <String, dynamic>{
      'overview': instance.overview,
      'recommended_keywords': instance.recommendedKeywords,
      'experiences': instance.experiences,
      'skills': instance.skills,
      'formatting': instance.formatting,
      'education': instance.education,
      'ats_friendly': instance.atsFriendly,
    };
