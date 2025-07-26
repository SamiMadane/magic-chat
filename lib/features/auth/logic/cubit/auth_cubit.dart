import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/features/auth/data/repo/auth_repo.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_state.dart';
import 'package:magicchat/core/models/user/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  String? _phoneNumber;
  UserModel? _user;

  AuthCubit({required this.authRepository}) : super(const AuthState.initial());

  void setPhoneNumber(String number) {
    _phoneNumber = number;
  }

  Future<void> sendOtp() async {
    if (_phoneNumber == null) return;
    emit(const AuthState.loading());

    final result = await authRepository.getUserIfExists(_phoneNumber!);

    result.when(
      success: (existingUser) {
        // ignore: unnecessary_null_comparison
        if (existingUser == null) {
          // مستخدم جديد
          emit(AuthState.otpSent(
            phoneNumber: _phoneNumber!,
            verificationId: '123456',
            isNewUser: true,
          ));
        } else {
          _user = existingUser;
          if (existingUser.isLoggedIn) {
            emit(AuthState.alreadyLoggedIn(user: existingUser));
          } else {
            emit(AuthState.otpSent(
              phoneNumber: _phoneNumber!,
              verificationId: '123456',
              isNewUser: false,
            ));
          }
        }
      },
      failure: (error) {
        emit(AuthState.authError(errorMessage: error));
      },
    );
  }

  Future<void> verifyOtp(String otp) async {
    if (otp == '123456') {
      if (_phoneNumber == null) {
        emit(const AuthState.authError(errorMessage: 'errors.user_not_found'));
        return;
      }

      if (_user != null && !_user!.isLoggedIn) {
        final markResult = await authRepository.markUserAsLoggedIn(_phoneNumber!);
        markResult.when(
          success: (_) async {
            await SharedPrefHelper.setData('user_phone', _phoneNumber!);
            emit(AuthState.authenticated(user: _user!));
          },
          failure: (error) {
            emit(AuthState.authError(errorMessage: error));
          },
        );
        return;
      }

      emit(const AuthState.awaitingProfileInfo());
    } else {
      emit(const AuthState.verificationFailed(errorMessage: "errors.invalid_otp"));
    }
  }

  Future<void> completeSignup({
    required String username,
    required File? imageFile,
  }) async {
    if (_phoneNumber == null) {
      emit(const AuthState.authError(errorMessage: 'errors.user_not_found'));
      return;
    }

    emit(const AuthState.loading());

    final result = await authRepository.saveUserToFirestore(
      phoneNumber: _phoneNumber!,
      username: username,
      imageFile: imageFile,
    );

    result.when(
      success: (user) {
        _user = user;
        emit(AuthState.authenticated(user: user));
      },
      failure: (failure) => emit(AuthState.authError(errorMessage: failure)),
    );
  }

  Future<void> logout() async {
    final result = await authRepository.logout();

    result.when(
      success: (_) async {
        _phoneNumber = null;
        _user = null;
        await SharedPrefHelper.removeData('user_phone');
        emit(const AuthState.unauthenticated());
      },
      failure: (error) {
        emit(AuthState.authError(errorMessage: error));
      },
    );
  }
}
