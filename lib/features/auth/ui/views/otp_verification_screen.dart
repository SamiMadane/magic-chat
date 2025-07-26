import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/assets_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  final String sentOtpCode;

  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.sentOtpCode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: WidthManager.w20),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) {
                  if (user.username.isNotEmpty) {
                    context.pushReplacementNamed(Routes.homeScreen);
                  } else {
                    context.pushReplacementNamed(Routes.usernameSetupScreen);
                  }
                },
                awaitingProfileInfo: () {
                  context.pushReplacementNamed(Routes.usernameSetupScreen);
                },
                authError: (errorMessage) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                },
                verificationFailed: (errorMessage) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetsManager.appIcon,
                    height: HeightManager.h140,
                    width: WidthManager.w140,
                  ),
                  SizedBox(height: HeightManager.h24),
                  Text(
                    'Welcome to MagicChat',
                    style: getBoldTextStyle(
                      fontSize: FontSizeManager.s16,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: HeightManager.h8),
                  Text(
                    'Enter the OTP sent to your number',
                    style: getMediumTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: theme.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: HeightManager.h30),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.message, color: Colors.deepPurple),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Your verification code is: $sentOtpCode',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.deepPurple.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: HeightManager.h20),
                  Text(
                    phoneNumber,
                    style: getBoldTextStyle(
                      fontSize: FontSizeManager.s16,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: HeightManager.h20),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    autoFocus: true,
                    cursorColor: theme.colorScheme.primary,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 50,
                      fieldWidth: 45,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.grey,
                      selectedColor: theme.colorScheme.primary,
                    ),
                    onChanged: (_) {},
                    onCompleted: (value) {
                      if (value.trim() != sentOtpCode) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Incorrect OTP code'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      print('Submitting OTP: $value');
                      context.read<AuthCubit>().verifyOtp(value);
                    },
                  ),
                  SizedBox(height: HeightManager.h30),
                  const Text(
                    "Code will be verified automatically after entry.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
