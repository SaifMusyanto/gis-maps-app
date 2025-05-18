// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cv_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CvEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistory,
    required TResult Function(CvModel cv) addHistory,
    required TResult Function(CvModel cv) deleteHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistory,
    TResult? Function(CvModel cv)? addHistory,
    TResult? Function(CvModel cv)? deleteHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistory,
    TResult Function(CvModel cv)? addHistory,
    TResult Function(CvModel cv)? deleteHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistory value) getHistory,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_DeleteHistory value) deleteHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistory value)? getHistory,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_DeleteHistory value)? deleteHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistory value)? getHistory,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_DeleteHistory value)? deleteHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CvEventCopyWith<$Res> {
  factory $CvEventCopyWith(CvEvent value, $Res Function(CvEvent) then) =
      _$CvEventCopyWithImpl<$Res, CvEvent>;
}

/// @nodoc
class _$CvEventCopyWithImpl<$Res, $Val extends CvEvent>
    implements $CvEventCopyWith<$Res> {
  _$CvEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CvEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CvEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistory,
    required TResult Function(CvModel cv) addHistory,
    required TResult Function(CvModel cv) deleteHistory,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistory,
    TResult? Function(CvModel cv)? addHistory,
    TResult? Function(CvModel cv)? deleteHistory,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistory,
    TResult Function(CvModel cv)? addHistory,
    TResult Function(CvModel cv)? deleteHistory,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistory value) getHistory,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_DeleteHistory value) deleteHistory,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistory value)? getHistory,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_DeleteHistory value)? deleteHistory,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistory value)? getHistory,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_DeleteHistory value)? deleteHistory,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CvEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetHistoryImplCopyWith<$Res> {
  factory _$$GetHistoryImplCopyWith(
          _$GetHistoryImpl value, $Res Function(_$GetHistoryImpl) then) =
      __$$GetHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHistoryImplCopyWithImpl<$Res>
    extends _$CvEventCopyWithImpl<$Res, _$GetHistoryImpl>
    implements _$$GetHistoryImplCopyWith<$Res> {
  __$$GetHistoryImplCopyWithImpl(
      _$GetHistoryImpl _value, $Res Function(_$GetHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetHistoryImpl implements _GetHistory {
  const _$GetHistoryImpl();

  @override
  String toString() {
    return 'CvEvent.getHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistory,
    required TResult Function(CvModel cv) addHistory,
    required TResult Function(CvModel cv) deleteHistory,
  }) {
    return getHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistory,
    TResult? Function(CvModel cv)? addHistory,
    TResult? Function(CvModel cv)? deleteHistory,
  }) {
    return getHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistory,
    TResult Function(CvModel cv)? addHistory,
    TResult Function(CvModel cv)? deleteHistory,
    required TResult orElse(),
  }) {
    if (getHistory != null) {
      return getHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistory value) getHistory,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_DeleteHistory value) deleteHistory,
  }) {
    return getHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistory value)? getHistory,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_DeleteHistory value)? deleteHistory,
  }) {
    return getHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistory value)? getHistory,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_DeleteHistory value)? deleteHistory,
    required TResult orElse(),
  }) {
    if (getHistory != null) {
      return getHistory(this);
    }
    return orElse();
  }
}

abstract class _GetHistory implements CvEvent {
  const factory _GetHistory() = _$GetHistoryImpl;
}

/// @nodoc
abstract class _$$AddHistoryImplCopyWith<$Res> {
  factory _$$AddHistoryImplCopyWith(
          _$AddHistoryImpl value, $Res Function(_$AddHistoryImpl) then) =
      __$$AddHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CvModel cv});

  $CvModelCopyWith<$Res> get cv;
}

/// @nodoc
class __$$AddHistoryImplCopyWithImpl<$Res>
    extends _$CvEventCopyWithImpl<$Res, _$AddHistoryImpl>
    implements _$$AddHistoryImplCopyWith<$Res> {
  __$$AddHistoryImplCopyWithImpl(
      _$AddHistoryImpl _value, $Res Function(_$AddHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cv = null,
  }) {
    return _then(_$AddHistoryImpl(
      null == cv
          ? _value.cv
          : cv // ignore: cast_nullable_to_non_nullable
              as CvModel,
    ));
  }

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CvModelCopyWith<$Res> get cv {
    return $CvModelCopyWith<$Res>(_value.cv, (value) {
      return _then(_value.copyWith(cv: value));
    });
  }
}

/// @nodoc

class _$AddHistoryImpl implements _AddHistory {
  const _$AddHistoryImpl(this.cv);

  @override
  final CvModel cv;

  @override
  String toString() {
    return 'CvEvent.addHistory(cv: $cv)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddHistoryImpl &&
            (identical(other.cv, cv) || other.cv == cv));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cv);

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddHistoryImplCopyWith<_$AddHistoryImpl> get copyWith =>
      __$$AddHistoryImplCopyWithImpl<_$AddHistoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistory,
    required TResult Function(CvModel cv) addHistory,
    required TResult Function(CvModel cv) deleteHistory,
  }) {
    return addHistory(cv);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistory,
    TResult? Function(CvModel cv)? addHistory,
    TResult? Function(CvModel cv)? deleteHistory,
  }) {
    return addHistory?.call(cv);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistory,
    TResult Function(CvModel cv)? addHistory,
    TResult Function(CvModel cv)? deleteHistory,
    required TResult orElse(),
  }) {
    if (addHistory != null) {
      return addHistory(cv);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistory value) getHistory,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_DeleteHistory value) deleteHistory,
  }) {
    return addHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistory value)? getHistory,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_DeleteHistory value)? deleteHistory,
  }) {
    return addHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistory value)? getHistory,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_DeleteHistory value)? deleteHistory,
    required TResult orElse(),
  }) {
    if (addHistory != null) {
      return addHistory(this);
    }
    return orElse();
  }
}

abstract class _AddHistory implements CvEvent {
  const factory _AddHistory(final CvModel cv) = _$AddHistoryImpl;

  CvModel get cv;

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddHistoryImplCopyWith<_$AddHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteHistoryImplCopyWith<$Res> {
  factory _$$DeleteHistoryImplCopyWith(
          _$DeleteHistoryImpl value, $Res Function(_$DeleteHistoryImpl) then) =
      __$$DeleteHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CvModel cv});

  $CvModelCopyWith<$Res> get cv;
}

/// @nodoc
class __$$DeleteHistoryImplCopyWithImpl<$Res>
    extends _$CvEventCopyWithImpl<$Res, _$DeleteHistoryImpl>
    implements _$$DeleteHistoryImplCopyWith<$Res> {
  __$$DeleteHistoryImplCopyWithImpl(
      _$DeleteHistoryImpl _value, $Res Function(_$DeleteHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cv = null,
  }) {
    return _then(_$DeleteHistoryImpl(
      null == cv
          ? _value.cv
          : cv // ignore: cast_nullable_to_non_nullable
              as CvModel,
    ));
  }

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CvModelCopyWith<$Res> get cv {
    return $CvModelCopyWith<$Res>(_value.cv, (value) {
      return _then(_value.copyWith(cv: value));
    });
  }
}

/// @nodoc

class _$DeleteHistoryImpl implements _DeleteHistory {
  const _$DeleteHistoryImpl(this.cv);

  @override
  final CvModel cv;

  @override
  String toString() {
    return 'CvEvent.deleteHistory(cv: $cv)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteHistoryImpl &&
            (identical(other.cv, cv) || other.cv == cv));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cv);

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteHistoryImplCopyWith<_$DeleteHistoryImpl> get copyWith =>
      __$$DeleteHistoryImplCopyWithImpl<_$DeleteHistoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistory,
    required TResult Function(CvModel cv) addHistory,
    required TResult Function(CvModel cv) deleteHistory,
  }) {
    return deleteHistory(cv);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistory,
    TResult? Function(CvModel cv)? addHistory,
    TResult? Function(CvModel cv)? deleteHistory,
  }) {
    return deleteHistory?.call(cv);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistory,
    TResult Function(CvModel cv)? addHistory,
    TResult Function(CvModel cv)? deleteHistory,
    required TResult orElse(),
  }) {
    if (deleteHistory != null) {
      return deleteHistory(cv);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistory value) getHistory,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_DeleteHistory value) deleteHistory,
  }) {
    return deleteHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistory value)? getHistory,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_DeleteHistory value)? deleteHistory,
  }) {
    return deleteHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistory value)? getHistory,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_DeleteHistory value)? deleteHistory,
    required TResult orElse(),
  }) {
    if (deleteHistory != null) {
      return deleteHistory(this);
    }
    return orElse();
  }
}

abstract class _DeleteHistory implements CvEvent {
  const factory _DeleteHistory(final CvModel cv) = _$DeleteHistoryImpl;

  CvModel get cv;

  /// Create a copy of CvEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteHistoryImplCopyWith<_$DeleteHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CvState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CvModel> history) loaded,
    required TResult Function() added,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CvModel> history)? loaded,
    TResult? Function()? added,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CvModel> history)? loaded,
    TResult Function()? added,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CvStateCopyWith<$Res> {
  factory $CvStateCopyWith(CvState value, $Res Function(CvState) then) =
      _$CvStateCopyWithImpl<$Res, CvState>;
}

/// @nodoc
class _$CvStateCopyWithImpl<$Res, $Val extends CvState>
    implements $CvStateCopyWith<$Res> {
  _$CvStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CvStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CvState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CvModel> history) loaded,
    required TResult Function() added,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CvModel> history)? loaded,
    TResult? Function()? added,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CvModel> history)? loaded,
    TResult Function()? added,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CvState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CvStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CvState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CvModel> history) loaded,
    required TResult Function() added,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CvModel> history)? loaded,
    TResult? Function()? added,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CvModel> history)? loaded,
    TResult Function()? added,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CvState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CvModel> history});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CvStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
  }) {
    return _then(_$LoadedImpl(
      null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<CvModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<CvModel> history) : _history = history;

  final List<CvModel> _history;
  @override
  List<CvModel> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  String toString() {
    return 'CvState.loaded(history: $history)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_history));

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CvModel> history) loaded,
    required TResult Function() added,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return loaded(history);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CvModel> history)? loaded,
    TResult? Function()? added,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(history);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CvModel> history)? loaded,
    TResult Function()? added,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(history);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CvState {
  const factory _Loaded(final List<CvModel> history) = _$LoadedImpl;

  List<CvModel> get history;

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddedImplCopyWith<$Res> {
  factory _$$AddedImplCopyWith(
          _$AddedImpl value, $Res Function(_$AddedImpl) then) =
      __$$AddedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddedImplCopyWithImpl<$Res>
    extends _$CvStateCopyWithImpl<$Res, _$AddedImpl>
    implements _$$AddedImplCopyWith<$Res> {
  __$$AddedImplCopyWithImpl(
      _$AddedImpl _value, $Res Function(_$AddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddedImpl implements _Added {
  const _$AddedImpl();

  @override
  String toString() {
    return 'CvState.added()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CvModel> history) loaded,
    required TResult Function() added,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return added();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CvModel> history)? loaded,
    TResult? Function()? added,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return added?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CvModel> history)? loaded,
    TResult Function()? added,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _Added implements CvState {
  const factory _Added() = _$AddedImpl;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
          _$DeletedImpl value, $Res Function(_$DeletedImpl) then) =
      __$$DeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$CvStateCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
      _$DeletedImpl _value, $Res Function(_$DeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeletedImpl implements _Deleted {
  const _$DeletedImpl();

  @override
  String toString() {
    return 'CvState.deleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CvModel> history) loaded,
    required TResult Function() added,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CvModel> history)? loaded,
    TResult? Function()? added,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CvModel> history)? loaded,
    TResult Function()? added,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements CvState {
  const factory _Deleted() = _$DeletedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CvStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CvState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CvModel> history) loaded,
    required TResult Function() added,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CvModel> history)? loaded,
    TResult? Function()? added,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CvModel> history)? loaded,
    TResult Function()? added,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CvState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of CvState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
