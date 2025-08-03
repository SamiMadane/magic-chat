// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FriendsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FriendsContactModel> friends) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FriendsContactModel> friends)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FriendsContactModel> friends)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FriendsInitial value) initial,
    required TResult Function(FriendsLoading value) loading,
    required TResult Function(FriendsSucess value) success,
    required TResult Function(FriendsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FriendsInitial value)? initial,
    TResult? Function(FriendsLoading value)? loading,
    TResult? Function(FriendsSucess value)? success,
    TResult? Function(FriendsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FriendsInitial value)? initial,
    TResult Function(FriendsLoading value)? loading,
    TResult Function(FriendsSucess value)? success,
    TResult Function(FriendsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsStateCopyWith<$Res> {
  factory $FriendsStateCopyWith(
          FriendsState value, $Res Function(FriendsState) then) =
      _$FriendsStateCopyWithImpl<$Res, FriendsState>;
}

/// @nodoc
class _$FriendsStateCopyWithImpl<$Res, $Val extends FriendsState>
    implements $FriendsStateCopyWith<$Res> {
  _$FriendsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FriendsInitialImplCopyWith<$Res> {
  factory _$$FriendsInitialImplCopyWith(_$FriendsInitialImpl value,
          $Res Function(_$FriendsInitialImpl) then) =
      __$$FriendsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FriendsInitialImplCopyWithImpl<$Res>
    extends _$FriendsStateCopyWithImpl<$Res, _$FriendsInitialImpl>
    implements _$$FriendsInitialImplCopyWith<$Res> {
  __$$FriendsInitialImplCopyWithImpl(
      _$FriendsInitialImpl _value, $Res Function(_$FriendsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FriendsInitialImpl implements _FriendsInitial {
  const _$FriendsInitialImpl();

  @override
  String toString() {
    return 'FriendsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FriendsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FriendsContactModel> friends) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FriendsContactModel> friends)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FriendsContactModel> friends)? success,
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
    required TResult Function(_FriendsInitial value) initial,
    required TResult Function(FriendsLoading value) loading,
    required TResult Function(FriendsSucess value) success,
    required TResult Function(FriendsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FriendsInitial value)? initial,
    TResult? Function(FriendsLoading value)? loading,
    TResult? Function(FriendsSucess value)? success,
    TResult? Function(FriendsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FriendsInitial value)? initial,
    TResult Function(FriendsLoading value)? loading,
    TResult Function(FriendsSucess value)? success,
    TResult Function(FriendsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _FriendsInitial implements FriendsState {
  const factory _FriendsInitial() = _$FriendsInitialImpl;
}

/// @nodoc
abstract class _$$FriendsLoadingImplCopyWith<$Res> {
  factory _$$FriendsLoadingImplCopyWith(_$FriendsLoadingImpl value,
          $Res Function(_$FriendsLoadingImpl) then) =
      __$$FriendsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FriendsLoadingImplCopyWithImpl<$Res>
    extends _$FriendsStateCopyWithImpl<$Res, _$FriendsLoadingImpl>
    implements _$$FriendsLoadingImplCopyWith<$Res> {
  __$$FriendsLoadingImplCopyWithImpl(
      _$FriendsLoadingImpl _value, $Res Function(_$FriendsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FriendsLoadingImpl implements FriendsLoading {
  const _$FriendsLoadingImpl();

  @override
  String toString() {
    return 'FriendsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FriendsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FriendsContactModel> friends) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FriendsContactModel> friends)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FriendsContactModel> friends)? success,
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
    required TResult Function(_FriendsInitial value) initial,
    required TResult Function(FriendsLoading value) loading,
    required TResult Function(FriendsSucess value) success,
    required TResult Function(FriendsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FriendsInitial value)? initial,
    TResult? Function(FriendsLoading value)? loading,
    TResult? Function(FriendsSucess value)? success,
    TResult? Function(FriendsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FriendsInitial value)? initial,
    TResult Function(FriendsLoading value)? loading,
    TResult Function(FriendsSucess value)? success,
    TResult Function(FriendsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FriendsLoading implements FriendsState {
  const factory FriendsLoading() = _$FriendsLoadingImpl;
}

/// @nodoc
abstract class _$$FriendsSucessImplCopyWith<$Res> {
  factory _$$FriendsSucessImplCopyWith(
          _$FriendsSucessImpl value, $Res Function(_$FriendsSucessImpl) then) =
      __$$FriendsSucessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FriendsContactModel> friends});
}

/// @nodoc
class __$$FriendsSucessImplCopyWithImpl<$Res>
    extends _$FriendsStateCopyWithImpl<$Res, _$FriendsSucessImpl>
    implements _$$FriendsSucessImplCopyWith<$Res> {
  __$$FriendsSucessImplCopyWithImpl(
      _$FriendsSucessImpl _value, $Res Function(_$FriendsSucessImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
  }) {
    return _then(_$FriendsSucessImpl(
      null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendsContactModel>,
    ));
  }
}

/// @nodoc

class _$FriendsSucessImpl implements FriendsSucess {
  const _$FriendsSucessImpl(final List<FriendsContactModel> friends)
      : _friends = friends;

  final List<FriendsContactModel> _friends;
  @override
  List<FriendsContactModel> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  String toString() {
    return 'FriendsState.success(friends: $friends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsSucessImpl &&
            const DeepCollectionEquality().equals(other._friends, _friends));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_friends));

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsSucessImplCopyWith<_$FriendsSucessImpl> get copyWith =>
      __$$FriendsSucessImplCopyWithImpl<_$FriendsSucessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FriendsContactModel> friends) success,
    required TResult Function(String message) error,
  }) {
    return success(friends);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FriendsContactModel> friends)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(friends);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FriendsContactModel> friends)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(friends);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FriendsInitial value) initial,
    required TResult Function(FriendsLoading value) loading,
    required TResult Function(FriendsSucess value) success,
    required TResult Function(FriendsError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FriendsInitial value)? initial,
    TResult? Function(FriendsLoading value)? loading,
    TResult? Function(FriendsSucess value)? success,
    TResult? Function(FriendsError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FriendsInitial value)? initial,
    TResult Function(FriendsLoading value)? loading,
    TResult Function(FriendsSucess value)? success,
    TResult Function(FriendsError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FriendsSucess implements FriendsState {
  const factory FriendsSucess(final List<FriendsContactModel> friends) =
      _$FriendsSucessImpl;

  List<FriendsContactModel> get friends;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendsSucessImplCopyWith<_$FriendsSucessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FriendsErrorImplCopyWith<$Res> {
  factory _$$FriendsErrorImplCopyWith(
          _$FriendsErrorImpl value, $Res Function(_$FriendsErrorImpl) then) =
      __$$FriendsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FriendsErrorImplCopyWithImpl<$Res>
    extends _$FriendsStateCopyWithImpl<$Res, _$FriendsErrorImpl>
    implements _$$FriendsErrorImplCopyWith<$Res> {
  __$$FriendsErrorImplCopyWithImpl(
      _$FriendsErrorImpl _value, $Res Function(_$FriendsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FriendsErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FriendsErrorImpl implements FriendsError {
  const _$FriendsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FriendsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsErrorImplCopyWith<_$FriendsErrorImpl> get copyWith =>
      __$$FriendsErrorImplCopyWithImpl<_$FriendsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FriendsContactModel> friends) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FriendsContactModel> friends)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FriendsContactModel> friends)? success,
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
    required TResult Function(_FriendsInitial value) initial,
    required TResult Function(FriendsLoading value) loading,
    required TResult Function(FriendsSucess value) success,
    required TResult Function(FriendsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FriendsInitial value)? initial,
    TResult? Function(FriendsLoading value)? loading,
    TResult? Function(FriendsSucess value)? success,
    TResult? Function(FriendsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FriendsInitial value)? initial,
    TResult Function(FriendsLoading value)? loading,
    TResult Function(FriendsSucess value)? success,
    TResult Function(FriendsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FriendsError implements FriendsState {
  const factory FriendsError(final String message) = _$FriendsErrorImpl;

  String get message;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendsErrorImplCopyWith<_$FriendsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
