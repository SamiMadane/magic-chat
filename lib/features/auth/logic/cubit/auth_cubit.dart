import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/features/auth/data/repo/auth_repo.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_state.dart';
import 'package:magicchat/features/home/data/model/user_model.dart';

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

    final existingUser = await authRepository.getUserIfExists(_phoneNumber!);

    if (existingUser == null) {
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
  }

  Future<void> verifyOtp(String otp) async {
    if (otp == '123456') {
      if (_phoneNumber == null) {
        emit(const AuthState.authError(errorMessage: 'رقم الهاتف غير موجود'));
        return;
      }

      if (_user != null && !_user!.isLoggedIn) {
        await authRepository.markUserAsLoggedIn(_phoneNumber!);
        await SharedPrefHelper.setData('user_phone', _phoneNumber!);
        emit(AuthState.authenticated(user: _user!));
        return;
      }
      debugPrint("New user detected, navigating to username setup.");

      emit(const AuthState.awaitingProfileInfo());
    } else {
      emit(const AuthState.verificationFailed(errorMessage: "OTP غير صحيح"));
    }
  }

  Future<void> completeSignup({
    required String username,
    required File? imageFile,
  }) async {
    if (_phoneNumber == null) {
      emit(const AuthState.authError(errorMessage: 'رقم الهاتف غير محدد'));
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
    await authRepository.logout();
    _phoneNumber = null;
    _user = null;
    await SharedPrefHelper.removeData('user_phone');
    emit(const AuthState.unauthenticated());
  }
}
