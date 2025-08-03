import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magicchat/core/helpers/image_helper.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/core/widgets/commn_profile_image_picker.dart';
import 'package:magicchat/core/widgets/primary_button.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_state.dart';
import 'package:magicchat/core/widgets/username_text_field.dart';
import 'package:magicchat/features/auth/ui/widgets/username_instructions.dart';

class UsernameSetupScreen extends StatefulWidget {
  const UsernameSetupScreen({super.key});

  @override
  State<UsernameSetupScreen> createState() => _UsernameSetupScreenState();
}

class _UsernameSetupScreenState extends State<UsernameSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  File? _selectedImage;
  bool _autoValidate = false;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final image =
        await ImageHelper.pickAndCropImage(context, ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImage = image);
    }
  }

  void _submit() {
    print(
        ' username is :${_usernameController.text.trim()} image file is :$_selectedImage ');
    print('befoar validation');
    if (!_formKey.currentState!.validate()) {
      print('during validation');

      setState(() => _autoValidate = true);
      return;
    }
    print('after validation');

    context.read<AuthCubit>().completeSignup(
          username: _usernameController.text.trim(),
          imageFile: _selectedImage,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('auth.user_name.set_up_profile'.tr())),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) =>
                Navigator.pushReplacementNamed(context, Routes.homeScreen),
            authError: (msg) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red),
            ),
            orElse: () {},
          );
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: WidthManager.w20, vertical: HeightManager.h100),
            child: Form(
              key: _formKey, // ✅ ربط الـ formKey
              autovalidateMode: _autoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonProfileImagePicker(
                    image: _selectedImage,
                    onTap: _pickImage,
                  ),
                  SizedBox(height: HeightManager.h16),
                  Text(
                    'auth.user_name.choose_profile_picture_optional'.tr(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: HeightManager.h30),
                  const UsernameInstructions(),
                  SizedBox(height: HeightManager.h30),
                  UsernameTextField(
                    controller: _usernameController,
                    autoValidate: _autoValidate,
                  ),
                  SizedBox(height: HeightManager.h30),
                  PrimaryButton(
                    onPressed: _submit,
                    label: 'auth.user_name.finish_setup'.tr(),
                  ),
                  SizedBox(height: HeightManager.h20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
