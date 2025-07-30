import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/helpers/image_helper.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/core/widgets/commn_profile_image_picker.dart';
import 'package:magicchat/core/widgets/custom_status_dialog.dart';
import 'package:magicchat/core/widgets/primary_button.dart';
import 'package:magicchat/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:magicchat/features/edit_profile/logic/cubit/edit_profile_state.dart';
import 'package:magicchat/core/widgets/username_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  File? _pickedImage;
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    context.read<EditProfileCubit>().loadUser();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final pickedFile =
        await ImageHelper.pickAndCropImage(context, ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _pickedImage = pickedFile);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      setState(() => _autoValidate = true);
      return;
    }

    context.read<EditProfileCubit>().updateUser(
          newName: _usernameController.text.trim(),
          newImage: _pickedImage,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('edit_profile.title'.tr())),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            showAnimatedStatusDialog(
              context: context,
              statusType: DialogStatusType.error,
              message: state.message,
              buttonText: 'Ok'.tr(),
              onConfirm: () {
                context.pop();
              },
            );
          }
          if (state is UpdateSuccess) {
            showAnimatedStatusDialog(
                context: context,
                statusType: DialogStatusType.success,
                message: 'edit_profile.update_success'.tr(),
                buttonText: 'Ok'.tr(),
                onConfirm: () {
                  context.pop();
                  context.pop();
                  context.pushReplacementNamed(
                    Routes.settingsScreen,
                    arguments: {
                      'isLoggedIn': true, // حسب القيمة الفعلية
                    },
                  );
                });
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileSuccess) {
            final user = state.user;
            _usernameController.text = user.username;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: WidthManager.w20,
                vertical: HeightManager.h40,
              ),
              child: Column(
                children: [
                  CommonProfileImagePicker(
                    image: _pickedImage,
                    imageUrl: user.imageUrl,
                    onTap: _pickImage,
                    editIconOnlyTap: true,
                  ),
                  SizedBox(height: HeightManager.h30),
                  Form(
                    key: _formKey,
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: UsernameTextField(
                      controller: _usernameController,
                      autoValidate: _autoValidate,
                    ),
                  ),
                  SizedBox(height: HeightManager.h20),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(user.phone, style: theme.textTheme.bodyLarge),
                      subtitle: Text('edit_profile.phone_number'.tr()),
                    ),
                  ),
                  SizedBox(height: HeightManager.h30),
                  PrimaryButton(
                    onPressed: _submit,
                    label: 'edit_profile.save_changes'.tr(),
                  ),
                ],
              ),
            );
          }

          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
