import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:magicchat/core/models/user/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.otpSent({
    required String phoneNumber,
    required String verificationId,
    required bool isNewUser,
  }) = OtpSent;

  const factory AuthState.verificationFailed({
    required String errorMessage,
  }) = VerificationFailed;

  const factory AuthState.awaitingProfileInfo() = AwaitingProfileInfo;

  const factory AuthState.alreadyLoggedIn({required UserModel user}) = AlreadyLoggedIn;

  const factory AuthState.authenticated({required UserModel user}) = Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.authError({
    required String errorMessage,
  }) = AuthError;
}
