import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_state.dart';
import 'package:magicchat/features/auth/ui/widgets/logo_header.dart';
import 'package:magicchat/features/auth/ui/widgets/otp_code_input.dart';
import 'package:magicchat/features/auth/ui/widgets/verification_code_info.dart';

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
      appBar: AppBar(title: Text('auth.otp_verification_title'.tr())),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: WidthManager.w20,vertical: HeightManager.h100),
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
                LogoHeader(
                  title: 'auth.logo_header.otp_title'.tr(),
                  subtitle: 'auth.logo_header.otp_subtitle'.tr(),
                ),
                SizedBox(height: HeightManager.h30),
                VerificationCodeInfo(sentOtpCode: sentOtpCode),
                SizedBox(height: HeightManager.h20),
                Text(
                  phoneNumber,
                  style: getBoldTextStyle(
                    fontSize: FontSizeManager.s16,
                    color: theme.colorScheme.primary,
                  ),
                ),
                SizedBox(height: HeightManager.h20),
                OtpCodeInput(
                  sentOtpCode: sentOtpCode,
                  onCompleted: (value) {
                    context.read<AuthCubit>().verifyOtp(value);
                  },
                ),
                SizedBox(height: HeightManager.h30),
                Text(
                  'auth.otp_auto_verify_note'.tr(),
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
