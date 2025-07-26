import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_state.dart';

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
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      setState(() {
        _autoValidate = true;
      });
      return;
    }

    final username = _usernameController.text.trim();
    context.read<AuthCubit>().completeSignup(
          username: username,
          imageFile: _selectedImage,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Set Up Profile')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) {
              // الانتقال للشاشة الرئيسية أو شاشة الدردشة بعد نجاح التسجيل
              Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
            },
            authError: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: WidthManager.w20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: HeightManager.h60,
                      backgroundColor: Colors.deepPurple.shade50,
                      backgroundImage:
                          _selectedImage != null ? FileImage(_selectedImage!) : null,
                      child: _selectedImage == null
                          ? Icon(Icons.camera_alt, size: 40, color: Colors.deepPurple)
                          : null,
                    ),
                  ),
                  SizedBox(height: HeightManager.h16),
                  Text(
                    'Choose a profile picture (optional)',
                    style: getMediumTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: HeightManager.h30),
                  Text(
                    'Set a username',
                    style: getBoldTextStyle(
                      fontSize: FontSizeManager.s16,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: HeightManager.h8),
                  Text(
                    'This name will be visible to other users',
                    style: getMediumTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: theme.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: HeightManager.h30),
                  Form(
                    key: _formKey,
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: const Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a username';
                        }
                        if (value.trim().length < 3) {
                          return 'Username must be at least 3 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: HeightManager.h30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Finish Setup',
                        style: getBoldTextStyle(
                          fontSize: FontSizeManager.s18,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
