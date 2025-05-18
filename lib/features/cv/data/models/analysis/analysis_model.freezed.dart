// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalysisModel _$AnalysisModelFromJson(Map<String, dynamic> json) {
  return _AnalysisModel.fromJson(json);
}

/// @nodoc
mixin _$AnalysisModel {
  @HiveField(0)
  String get overview => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String> get recommendedKeywords => throw _privateConstructorUsedError;
  @HiveField(2)
  AnalysisAspectModel get experiences => throw _privateConstructorUsedError;
  @HiveField(3)
  AnalysisAspectModel get skills => throw _privateConstructorUsedError;
  @HiveField(4)
  AnalysisAspectModel get formatting => throw _privateConstructorUsedError;
  @HiveField(5)
  AnalysisAspectModel get education => throw _privateConstructorUsedError;
  @HiveField(6)
  AnalysisAspectModel get atsFriendly => throw _privateConstructorUsedError;

  /// Serializes this AnalysisModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisModelCopyWith<AnalysisModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisModelCopyWith<$Res> {
  factory $AnalysisModelCopyWith(
          AnalysisModel value, $Res Function(AnalysisModel) then) =
      _$AnalysisModelCopyWithImpl<$Res, AnalysisModel>;
  @useResult
  $Res call(
      {@HiveField(0) String overview,
      @HiveField(1) List<String> recommendedKeywords,
      @HiveField(2) AnalysisAspectModel experiences,
      @HiveField(3) AnalysisAspectModel skills,
      @HiveField(4) AnalysisAspectModel formatting,
      @HiveField(5) AnalysisAspectModel education,
      @HiveField(6) AnalysisAspectModel atsFriendly});

  $AnalysisAspectModelCopyWith<$Res> get experiences;
  $AnalysisAspectModelCopyWith<$Res> get skills;
  $AnalysisAspectModelCopyWith<$Res> get formatting;
  $AnalysisAspectModelCopyWith<$Res> get education;
  $AnalysisAspectModelCopyWith<$Res> get atsFriendly;
}

/// @nodoc
class _$AnalysisModelCopyWithImpl<$Res, $Val extends AnalysisModel>
    implements $AnalysisModelCopyWith<$Res> {
  _$AnalysisModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = null,
    Object? recommendedKeywords = null,
    Object? experiences = null,
    Object? skills = null,
    Object? formatting = null,
    Object? education = null,
    Object? atsFriendly = null,
  }) {
    return _then(_value.copyWith(
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      recommendedKeywords: null == recommendedKeywords
          ? _value.recommendedKeywords
          : recommendedKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      experiences: null == experiences
          ? _value.experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
      formatting: null == formatting
          ? _value.formatting
          : formatting // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
      atsFriendly: null == atsFriendly
          ? _value.atsFriendly
          : atsFriendly // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
    ) as $Val);
  }

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalysisAspectModelCopyWith<$Res> get experiences {
    return $AnalysisAspectModelCopyWith<$Res>(_value.experiences, (value) {
      return _then(_value.copyWith(experiences: value) as $Val);
    });
  }

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalysisAspectModelCopyWith<$Res> get skills {
    return $AnalysisAspectModelCopyWith<$Res>(_value.skills, (value) {
      return _then(_value.copyWith(skills: value) as $Val);
    });
  }

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalysisAspectModelCopyWith<$Res> get formatting {
    return $AnalysisAspectModelCopyWith<$Res>(_value.formatting, (value) {
      return _then(_value.copyWith(formatting: value) as $Val);
    });
  }

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalysisAspectModelCopyWith<$Res> get education {
    return $AnalysisAspectModelCopyWith<$Res>(_value.education, (value) {
      return _then(_value.copyWith(education: value) as $Val);
    });
  }

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalysisAspectModelCopyWith<$Res> get atsFriendly {
    return $AnalysisAspectModelCopyWith<$Res>(_value.atsFriendly, (value) {
      return _then(_value.copyWith(atsFriendly: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalysisModelImplCopyWith<$Res>
    implements $AnalysisModelCopyWith<$Res> {
  factory _$$AnalysisModelImplCopyWith(
          _$AnalysisModelImpl value, $Res Function(_$AnalysisModelImpl) then) =
      __$$AnalysisModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String overview,
      @HiveField(1) List<String> recommendedKeywords,
      @HiveField(2) AnalysisAspectModel experiences,
      @HiveField(3) AnalysisAspectModel skills,
      @HiveField(4) AnalysisAspectModel formatting,
      @HiveField(5) AnalysisAspectModel education,
      @HiveField(6) AnalysisAspectModel atsFriendly});

  @override
  $AnalysisAspectModelCopyWith<$Res> get experiences;
  @override
  $AnalysisAspectModelCopyWith<$Res> get skills;
  @override
  $AnalysisAspectModelCopyWith<$Res> get formatting;
  @override
  $AnalysisAspectModelCopyWith<$Res> get education;
  @override
  $AnalysisAspectModelCopyWith<$Res> get atsFriendly;
}

/// @nodoc
class __$$AnalysisModelImplCopyWithImpl<$Res>
    extends _$AnalysisModelCopyWithImpl<$Res, _$AnalysisModelImpl>
    implements _$$AnalysisModelImplCopyWith<$Res> {
  __$$AnalysisModelImplCopyWithImpl(
      _$AnalysisModelImpl _value, $Res Function(_$AnalysisModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = null,
    Object? recommendedKeywords = null,
    Object? experiences = null,
    Object? skills = null,
    Object? formatting = null,
    Object? education = null,
    Object? atsFriendly = null,
  }) {
    return _then(_$AnalysisModelImpl(
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      recommendedKeywords: null == recommendedKeywords
          ? _value._recommendedKeywords
          : recommendedKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      experiences: null == experiences
          ? _value.experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
      formatting: null == formatting
          ? _value.formatting
          : formatting // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
      atsFriendly: null == atsFriendly
          ? _value.atsFriendly
          : atsFriendly // ignore: cast_nullable_to_non_nullable
              as AnalysisAspectModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AnalysisModelImpl implements _AnalysisModel {
  const _$AnalysisModelImpl(
      {@HiveField(0) required this.overview,
      @HiveField(1) required final List<String> recommendedKeywords,
      @HiveField(2) required this.experiences,
      @HiveField(3) required this.skills,
      @HiveField(4) required this.formatting,
      @HiveField(5) required this.education,
      @HiveField(6) required this.atsFriendly})
      : _recommendedKeywords = recommendedKeywords;

  factory _$AnalysisModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisModelImplFromJson(json);

  @override
  @HiveField(0)
  final String overview;
  final List<String> _recommendedKeywords;
  @override
  @HiveField(1)
  List<String> get recommendedKeywords {
    if (_recommendedKeywords is EqualUnmodifiableListView)
      return _recommendedKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedKeywords);
  }

  @override
  @HiveField(2)
  final AnalysisAspectModel experiences;
  @override
  @HiveField(3)
  final AnalysisAspectModel skills;
  @override
  @HiveField(4)
  final AnalysisAspectModel formatting;
  @override
  @HiveField(5)
  final AnalysisAspectModel education;
  @override
  @HiveField(6)
  final AnalysisAspectModel atsFriendly;

  @override
  String toString() {
    return 'AnalysisModel(overview: $overview, recommendedKeywords: $recommendedKeywords, experiences: $experiences, skills: $skills, formatting: $formatting, education: $education, atsFriendly: $atsFriendly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisModelImpl &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            const DeepCollectionEquality()
                .equals(other._recommendedKeywords, _recommendedKeywords) &&
            (identical(other.experiences, experiences) ||
                other.experiences == experiences) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.formatting, formatting) ||
                other.formatting == formatting) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.atsFriendly, atsFriendly) ||
                other.atsFriendly == atsFriendly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      overview,
      const DeepCollectionEquality().hash(_recommendedKeywords),
      experiences,
      skills,
      formatting,
      education,
      atsFriendly);

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisModelImplCopyWith<_$AnalysisModelImpl> get copyWith =>
      __$$AnalysisModelImplCopyWithImpl<_$AnalysisModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisModelImplToJson(
      this,
    );
  }
}

abstract class _AnalysisModel implements AnalysisModel {
  const factory _AnalysisModel(
          {@HiveField(0) required final String overview,
          @HiveField(1) required final List<String> recommendedKeywords,
          @HiveField(2) required final AnalysisAspectModel experiences,
          @HiveField(3) required final AnalysisAspectModel skills,
          @HiveField(4) required final AnalysisAspectModel formatting,
          @HiveField(5) required final AnalysisAspectModel education,
          @HiveField(6) required final AnalysisAspectModel atsFriendly}) =
      _$AnalysisModelImpl;

  factory _AnalysisModel.fromJson(Map<String, dynamic> json) =
      _$AnalysisModelImpl.fromJson;

  @override
  @HiveField(0)
  String get overview;
  @override
  @HiveField(1)
  List<String> get recommendedKeywords;
  @override
  @HiveField(2)
  AnalysisAspectModel get experiences;
  @override
  @HiveField(3)
  AnalysisAspectModel get skills;
  @override
  @HiveField(4)
  AnalysisAspectModel get formatting;
  @override
  @HiveField(5)
  AnalysisAspectModel get education;
  @override
  @HiveField(6)
  AnalysisAspectModel get atsFriendly;

  /// Create a copy of AnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisModelImplCopyWith<_$AnalysisModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
