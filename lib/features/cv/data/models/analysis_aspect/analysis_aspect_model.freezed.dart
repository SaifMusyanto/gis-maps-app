// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_aspect_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalysisAspectModel _$AnalysisAspectModelFromJson(Map<String, dynamic> json) {
  return _AnalysisAspectModel.fromJson(json);
}

/// @nodoc
mixin _$AnalysisAspectModel {
  @HiveField(0)
  int? get score => throw _privateConstructorUsedError;
  @HiveField(1)
  String get analysis => throw _privateConstructorUsedError;
  @HiveField(2)
  List<String> get improvements => throw _privateConstructorUsedError;
  @HiveField(3)
  List<String> get corrections => throw _privateConstructorUsedError;

  /// Serializes this AnalysisAspectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisAspectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisAspectModelCopyWith<AnalysisAspectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisAspectModelCopyWith<$Res> {
  factory $AnalysisAspectModelCopyWith(
          AnalysisAspectModel value, $Res Function(AnalysisAspectModel) then) =
      _$AnalysisAspectModelCopyWithImpl<$Res, AnalysisAspectModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? score,
      @HiveField(1) String analysis,
      @HiveField(2) List<String> improvements,
      @HiveField(3) List<String> corrections});
}

/// @nodoc
class _$AnalysisAspectModelCopyWithImpl<$Res, $Val extends AnalysisAspectModel>
    implements $AnalysisAspectModelCopyWith<$Res> {
  _$AnalysisAspectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisAspectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? analysis = null,
    Object? improvements = null,
    Object? corrections = null,
  }) {
    return _then(_value.copyWith(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as String,
      improvements: null == improvements
          ? _value.improvements
          : improvements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      corrections: null == corrections
          ? _value.corrections
          : corrections // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalysisAspectModelImplCopyWith<$Res>
    implements $AnalysisAspectModelCopyWith<$Res> {
  factory _$$AnalysisAspectModelImplCopyWith(_$AnalysisAspectModelImpl value,
          $Res Function(_$AnalysisAspectModelImpl) then) =
      __$$AnalysisAspectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? score,
      @HiveField(1) String analysis,
      @HiveField(2) List<String> improvements,
      @HiveField(3) List<String> corrections});
}

/// @nodoc
class __$$AnalysisAspectModelImplCopyWithImpl<$Res>
    extends _$AnalysisAspectModelCopyWithImpl<$Res, _$AnalysisAspectModelImpl>
    implements _$$AnalysisAspectModelImplCopyWith<$Res> {
  __$$AnalysisAspectModelImplCopyWithImpl(_$AnalysisAspectModelImpl _value,
      $Res Function(_$AnalysisAspectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalysisAspectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? analysis = null,
    Object? improvements = null,
    Object? corrections = null,
  }) {
    return _then(_$AnalysisAspectModelImpl(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as String,
      improvements: null == improvements
          ? _value._improvements
          : improvements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      corrections: null == corrections
          ? _value._corrections
          : corrections // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AnalysisAspectModelImpl implements _AnalysisAspectModel {
  const _$AnalysisAspectModelImpl(
      {@HiveField(0) required this.score,
      @HiveField(1) required this.analysis,
      @HiveField(2) required final List<String> improvements,
      @HiveField(3) required final List<String> corrections})
      : _improvements = improvements,
        _corrections = corrections;

  factory _$AnalysisAspectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisAspectModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? score;
  @override
  @HiveField(1)
  final String analysis;
  final List<String> _improvements;
  @override
  @HiveField(2)
  List<String> get improvements {
    if (_improvements is EqualUnmodifiableListView) return _improvements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_improvements);
  }

  final List<String> _corrections;
  @override
  @HiveField(3)
  List<String> get corrections {
    if (_corrections is EqualUnmodifiableListView) return _corrections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_corrections);
  }

  @override
  String toString() {
    return 'AnalysisAspectModel(score: $score, analysis: $analysis, improvements: $improvements, corrections: $corrections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisAspectModelImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.analysis, analysis) ||
                other.analysis == analysis) &&
            const DeepCollectionEquality()
                .equals(other._improvements, _improvements) &&
            const DeepCollectionEquality()
                .equals(other._corrections, _corrections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      score,
      analysis,
      const DeepCollectionEquality().hash(_improvements),
      const DeepCollectionEquality().hash(_corrections));

  /// Create a copy of AnalysisAspectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisAspectModelImplCopyWith<_$AnalysisAspectModelImpl> get copyWith =>
      __$$AnalysisAspectModelImplCopyWithImpl<_$AnalysisAspectModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisAspectModelImplToJson(
      this,
    );
  }
}

abstract class _AnalysisAspectModel implements AnalysisAspectModel {
  const factory _AnalysisAspectModel(
          {@HiveField(0) required final int? score,
          @HiveField(1) required final String analysis,
          @HiveField(2) required final List<String> improvements,
          @HiveField(3) required final List<String> corrections}) =
      _$AnalysisAspectModelImpl;

  factory _AnalysisAspectModel.fromJson(Map<String, dynamic> json) =
      _$AnalysisAspectModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get score;
  @override
  @HiveField(1)
  String get analysis;
  @override
  @HiveField(2)
  List<String> get improvements;
  @override
  @HiveField(3)
  List<String> get corrections;

  /// Create a copy of AnalysisAspectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisAspectModelImplCopyWith<_$AnalysisAspectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
