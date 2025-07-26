// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
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
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
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
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
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
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
          _$AuthLoadingImpl value, $Res Function(_$AuthLoadingImpl) then) =
      __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl _value, $Res Function(_$AuthLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoadingImpl implements AuthLoading {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
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
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  const factory AuthLoading() = _$AuthLoadingImpl;
}

/// @nodoc
abstract class _$$OtpSentImplCopyWith<$Res> {
  factory _$$OtpSentImplCopyWith(
          _$OtpSentImpl value, $Res Function(_$OtpSentImpl) then) =
      __$$OtpSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String verificationId, bool isNewUser});
}

/// @nodoc
class __$$OtpSentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$OtpSentImpl>
    implements _$$OtpSentImplCopyWith<$Res> {
  __$$OtpSentImplCopyWithImpl(
      _$OtpSentImpl _value, $Res Function(_$OtpSentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? verificationId = null,
    Object? isNewUser = null,
  }) {
    return _then(_$OtpSentImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OtpSentImpl implements OtpSent {
  const _$OtpSentImpl(
      {required this.phoneNumber,
      required this.verificationId,
      required this.isNewUser});

  @override
  final String phoneNumber;
  @override
  final String verificationId;
  @override
  final bool isNewUser;

  @override
  String toString() {
    return 'AuthState.otpSent(phoneNumber: $phoneNumber, verificationId: $verificationId, isNewUser: $isNewUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpSentImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, verificationId, isNewUser);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpSentImplCopyWith<_$OtpSentImpl> get copyWith =>
      __$$OtpSentImplCopyWithImpl<_$OtpSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return otpSent(phoneNumber, verificationId, isNewUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return otpSent?.call(phoneNumber, verificationId, isNewUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(phoneNumber, verificationId, isNewUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return otpSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return otpSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class OtpSent implements AuthState {
  const factory OtpSent(
      {required final String phoneNumber,
      required final String verificationId,
      required final bool isNewUser}) = _$OtpSentImpl;

  String get phoneNumber;
  String get verificationId;
  bool get isNewUser;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpSentImplCopyWith<_$OtpSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationFailedImplCopyWith<$Res> {
  factory _$$VerificationFailedImplCopyWith(_$VerificationFailedImpl value,
          $Res Function(_$VerificationFailedImpl) then) =
      __$$VerificationFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$VerificationFailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerificationFailedImpl>
    implements _$$VerificationFailedImplCopyWith<$Res> {
  __$$VerificationFailedImplCopyWithImpl(_$VerificationFailedImpl _value,
      $Res Function(_$VerificationFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$VerificationFailedImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerificationFailedImpl implements VerificationFailed {
  const _$VerificationFailedImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthState.verificationFailed(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationFailedImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationFailedImplCopyWith<_$VerificationFailedImpl> get copyWith =>
      __$$VerificationFailedImplCopyWithImpl<_$VerificationFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return verificationFailed(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return verificationFailed?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return verificationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return verificationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(this);
    }
    return orElse();
  }
}

abstract class VerificationFailed implements AuthState {
  const factory VerificationFailed({required final String errorMessage}) =
      _$VerificationFailedImpl;

  String get errorMessage;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationFailedImplCopyWith<_$VerificationFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AwaitingProfileInfoImplCopyWith<$Res> {
  factory _$$AwaitingProfileInfoImplCopyWith(_$AwaitingProfileInfoImpl value,
          $Res Function(_$AwaitingProfileInfoImpl) then) =
      __$$AwaitingProfileInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AwaitingProfileInfoImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AwaitingProfileInfoImpl>
    implements _$$AwaitingProfileInfoImplCopyWith<$Res> {
  __$$AwaitingProfileInfoImplCopyWithImpl(_$AwaitingProfileInfoImpl _value,
      $Res Function(_$AwaitingProfileInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AwaitingProfileInfoImpl implements AwaitingProfileInfo {
  const _$AwaitingProfileInfoImpl();

  @override
  String toString() {
    return 'AuthState.awaitingProfileInfo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwaitingProfileInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return awaitingProfileInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return awaitingProfileInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
    required TResult orElse(),
  }) {
    if (awaitingProfileInfo != null) {
      return awaitingProfileInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return awaitingProfileInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return awaitingProfileInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (awaitingProfileInfo != null) {
      return awaitingProfileInfo(this);
    }
    return orElse();
  }
}

abstract class AwaitingProfileInfo implements AuthState {
  const factory AwaitingProfileInfo() = _$AwaitingProfileInfoImpl;
}

/// @nodoc
abstract class _$$AlreadyLoggedInImplCopyWith<$Res> {
  factory _$$AlreadyLoggedInImplCopyWith(_$AlreadyLoggedInImpl value,
          $Res Function(_$AlreadyLoggedInImpl) then) =
      __$$AlreadyLoggedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$AlreadyLoggedInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AlreadyLoggedInImpl>
    implements _$$AlreadyLoggedInImplCopyWith<$Res> {
  __$$AlreadyLoggedInImplCopyWithImpl(
      _$AlreadyLoggedInImpl _value, $Res Function(_$AlreadyLoggedInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AlreadyLoggedInImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$AlreadyLoggedInImpl implements AlreadyLoggedIn {
  const _$AlreadyLoggedInImpl({required this.user});

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.alreadyLoggedIn(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlreadyLoggedInImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlreadyLoggedInImplCopyWith<_$AlreadyLoggedInImpl> get copyWith =>
      __$$AlreadyLoggedInImplCopyWithImpl<_$AlreadyLoggedInImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return alreadyLoggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return alreadyLoggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
    required TResult orElse(),
  }) {
    if (alreadyLoggedIn != null) {
      return alreadyLoggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return alreadyLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return alreadyLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (alreadyLoggedIn != null) {
      return alreadyLoggedIn(this);
    }
    return orElse();
  }
}

abstract class AlreadyLoggedIn implements AuthState {
  const factory AlreadyLoggedIn({required final UserModel user}) =
      _$AlreadyLoggedInImpl;

  UserModel get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlreadyLoggedInImplCopyWith<_$AlreadyLoggedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthenticatedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$AuthenticatedImpl implements Authenticated {
  const _$AuthenticatedImpl({required this.user});

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated({required final UserModel user}) =
      _$AuthenticatedImpl;

  UserModel get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthenticatedImpl implements Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$AuthErrorImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  const _$AuthErrorImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthState.authError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String phoneNumber, String verificationId, bool isNewUser)
        otpSent,
    required TResult Function(String errorMessage) verificationFailed,
    required TResult Function() awaitingProfileInfo,
    required TResult Function(UserModel user) alreadyLoggedIn,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String errorMessage) authError,
  }) {
    return authError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult? Function(String errorMessage)? verificationFailed,
    TResult? Function()? awaitingProfileInfo,
    TResult? Function(UserModel user)? alreadyLoggedIn,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String errorMessage)? authError,
  }) {
    return authError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String phoneNumber, String verificationId, bool isNewUser)?
        otpSent,
    TResult Function(String errorMessage)? verificationFailed,
    TResult Function()? awaitingProfileInfo,
    TResult Function(UserModel user)? alreadyLoggedIn,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String errorMessage)? authError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(OtpSent value) otpSent,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(AwaitingProfileInfo value) awaitingProfileInfo,
    required TResult Function(AlreadyLoggedIn value) alreadyLoggedIn,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) authError,
  }) {
    return authError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(OtpSent value)? otpSent,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult? Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? authError,
  }) {
    return authError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(OtpSent value)? otpSent,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(AwaitingProfileInfo value)? awaitingProfileInfo,
    TResult Function(AlreadyLoggedIn value)? alreadyLoggedIn,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError({required final String errorMessage}) =
      _$AuthErrorImpl;

  String get errorMessage;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
