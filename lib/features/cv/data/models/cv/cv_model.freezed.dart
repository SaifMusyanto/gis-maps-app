// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cv_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CvModel _$CvModelFromJson(Map<String, dynamic> json) {
  return _CvModel.fromJson(json);
}

/// @nodoc
mixin _$CvModel {
  @HiveField(0)
  String? get fileName => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get filePath => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(3)
  CvPurpose? get purpose => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get position => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get overallScore => throw _privateConstructorUsedError;
  @HiveField(7)
  AnalysisModel? get analysis => throw _privateConstructorUsedError;

  /// Serializes this CvModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CvModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CvModelCopyWith<CvModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CvModelCopyWith<$Res> {
  factory $CvModelCopyWith(CvModel value, $Res Function(CvModel) then) =
      _$CvModelCopyWithImpl<$Res, CvModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? fileName,
      @HiveField(1) String? filePath,
      @HiveField(2) DateTime? createdAt,
      @HiveField(3) CvPurpose? purpose,
      @HiveField(4) String? position,
      @HiveField(5) String? description,
      @HiveField(6) int? overallScore,
      @HiveField(7) AnalysisModel? analysis});

  $AnalysisModelCopyWith<$Res>? get analysis;
}

/// @nodoc
class _$CvModelCopyWithImpl<$Res, $Val extends CvModel>
    implements $CvModelCopyWith<$Res> {
  _$CvModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CvModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? createdAt = freezed,
    Object? purpose = freezed,
    Object? position = freezed,
    Object? description = freezed,
    Object? overallScore = freezed,
    Object? analysis = freezed,
  }) {
    return _then(_value.copyWith(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as CvPurpose?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as AnalysisModel?,
    ) as $Val);
  }

  /// Create a copy of CvModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalysisModelCopyWith<$Res>? get analysis {
    if (_value.analysis == null) {
      return null;
    }

    return $AnalysisModelCopyWith<$Res>(_value.analysis!, (value) {
      return _then(_value.copyWith(analysis: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CvModelImplCopyWith<$Res> implements $CvModelCopyWith<$Res> {
  factory _$$CvModelImplCopyWith(
          _$CvModelImpl value, $Res Function(_$CvModelImpl) then) =
      __$$CvModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? fileName,
      @HiveField(1) String? filePath,
      @HiveField(2) DateTime? createdAt,
      @HiveField(3) CvPurpose? purpose,
      @HiveField(4) String? position,
      @HiveField(5) String? description,
      @HiveField(6) int? overallScore,
      @HiveField(7) AnalysisModel? analysis});

  @override
  $AnalysisModelCopyWith<$Res>? get analysis;
}

/// @nodoc
class __$$CvModelImplCopyWithImpl<$Res>
    extends _$CvModelCopyWithImpl<$Res, _$CvModelImpl>
    implements _$$CvModelImplCopyWith<$Res> {
  __$$CvModelImplCopyWithImpl(
      _$CvModelImpl _value, $Res Function(_$CvModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? createdAt = freezed,
    Object? purpose = freezed,
    Object? position = freezed,
    Object? description = freezed,
    Object? overallScore = freezed,
    Object? analysis = freezed,
  }) {
    return _then(_$CvModelImpl(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as CvPurpose?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as AnalysisModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CvModelImpl implements _CvModel {
  const _$CvModelImpl(
      {@HiveField(0) required this.fileName,
      @HiveField(1) required this.filePath,
      @HiveField(2) required this.createdAt,
      @HiveField(3) required this.purpose,
      @HiveField(4) required this.position,
      @HiveField(5) required this.description,
      @HiveField(6) this.overallScore,
      @HiveField(7) this.analysis});

  factory _$CvModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CvModelImplFromJson(json);

  @override
  @HiveField(0)
  final String? fileName;
  @override
  @HiveField(1)
  final String? filePath;
  @override
  @HiveField(2)
  final DateTime? createdAt;
  @override
  @HiveField(3)
  final CvPurpose? purpose;
  @override
  @HiveField(4)
  final String? position;
  @override
  @HiveField(5)
  final String? description;
  @override
  @HiveField(6)
  final int? overallScore;
  @override
  @HiveField(7)
  final AnalysisModel? analysis;

  @override
  String toString() {
    return 'CvModel(fileName: $fileName, filePath: $filePath, createdAt: $createdAt, purpose: $purpose, position: $position, description: $description, overallScore: $overallScore, analysis: $analysis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CvModelImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.analysis, analysis) ||
                other.analysis == analysis));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, filePath, createdAt,
      purpose, position, description, overallScore, analysis);

  /// Create a copy of CvModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CvModelImplCopyWith<_$CvModelImpl> get copyWith =>
      __$$CvModelImplCopyWithImpl<_$CvModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CvModelImplToJson(
      this,
    );
  }
}

abstract class _CvModel implements CvModel {
  const factory _CvModel(
      {@HiveField(0) required final String? fileName,
      @HiveField(1) required final String? filePath,
      @HiveField(2) required final DateTime? createdAt,
      @HiveField(3) required final CvPurpose? purpose,
      @HiveField(4) required final String? position,
      @HiveField(5) required final String? description,
      @HiveField(6) final int? overallScore,
      @HiveField(7) final AnalysisModel? analysis}) = _$CvModelImpl;

  factory _CvModel.fromJson(Map<String, dynamic> json) = _$CvModelImpl.fromJson;

  @override
  @HiveField(0)
  String? get fileName;
  @override
  @HiveField(1)
  String? get filePath;
  @override
  @HiveField(2)
  DateTime? get createdAt;
  @override
  @HiveField(3)
  CvPurpose? get purpose;
  @override
  @HiveField(4)
  String? get position;
  @override
  @HiveField(5)
  String? get description;
  @override
  @HiveField(6)
  int? get overallScore;
  @override
  @HiveField(7)
  AnalysisModel? get analysis;

  /// Create a copy of CvModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CvModelImplCopyWith<_$CvModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
