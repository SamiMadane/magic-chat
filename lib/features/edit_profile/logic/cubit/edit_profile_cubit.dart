import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/features/user/data/repo/user_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserRepository userRepository;

  EditProfileCubit({required this.userRepository})
      : super(const EditProfileState.initial());

  void loadUser() async {
    emit(const EditProfileState.loading());

    try {
      userRepository.getUserDataByPhone().listen((result) {
        result.when(
          success: (user) => emit(ProfileSuccess(user)),
          failure: (error) => emit(ProfileError(error)),
        );
      });
    } catch (e) {
      emit(ProfileError('errors.unexpected'.tr()));
    }
  }

  Future<void> updateUser({
    required String newName,
    File? newImage,
  }) async {
    if (state is! ProfileSuccess) return;

    final currentUser = (state as ProfileSuccess).user;

    final result = await userRepository.updateUserProfile(
      phone: currentUser.phone,
      newName: newName,
      newImage: newImage,
    );

    result.when(
      success: (_) async {
        // بعد التحديث، نعيد تحميل بيانات المستخدم
        loadUser();
        emit(const UpdateSuccess());
      },
      failure: (error) => emit(EditProfileState.error(error)),
    );
  }
}
