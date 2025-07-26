import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/resourses/assets_manager.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/core/widgets/custom_button.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:magicchat/features/auth/logic/cubit/auth_state.dart';

class PhoneInputScreen extends StatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  State<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String countryCode = '+970'; // افتراضي فلسطين
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OtpSent) {
            Navigator.of(context).pushNamed(
              Routes.otpVerificationScreen,
              arguments: {
                'phoneNumber': state.phoneNumber,
                'sentOtpCode': state.verificationId,
              },
            );
          } else if (state is AlreadyLoggedIn) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('رقم مستخدم بالفعل'),
                content: const Text(
                    'هذا الرقم مرتبط بحساب نشط، يرجى تسجيل الخروج أولاً.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                      context.pop();
                      context.pop();
                    },
                    child: const Text('حسناً'),
                  ),
                ],
              ),
            );
          }
        },
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: WidthManager.w20),
            child: Column(
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
                  'Enter your phone number to continue',
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
                  child: IntlPhoneField(
                    initialCountryCode: 'PS',
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (phone) {
                      setState(() {
                        countryCode = phone.countryCode;
                        phoneNumber = phone.number.trim();
                      });
                    },
                    validator: (phone) {
                      if (phone == null || phone.number.trim().isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: HeightManager.h30),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(
                      label: 'Send OTP',
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (!isValid) {
                          setState(() {
                            _autoValidate = true;
                          });
                          return;
                        }

                        final fullPhoneNumber = '$countryCode$phoneNumber';
                        final authCubit = context.read<AuthCubit>();
                        authCubit.setPhoneNumber(fullPhoneNumber);
                        authCubit.sendOtp();
                      },
                      type: ButtonType.elevated,
                      textStyle: TextStyle(
                        fontSize: FontSizeManager.s18,
                        fontWeight: FontWeight.bold,
                      ),
                      // لو حابب تضيف padding أو borderRadius خاص، ممكن تعدل الـ CustomButton لقبولها
                    )),
                SizedBox(height: HeightManager.h20),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const CircularProgressIndicator(),
                      authError: (message) => Text(
                        message,
                        style: const TextStyle(color: Colors.red),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
