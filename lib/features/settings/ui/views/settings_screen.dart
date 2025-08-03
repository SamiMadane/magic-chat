import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_cubit.dart';
import 'package:magicchat/features/settings/logic/cubit/settings_state.dart';
import 'package:magicchat/features/settings/ui/widgets/settings_body.dart';

class SettingsScreen extends StatefulWidget {
  final bool isLoggedIn;

  const SettingsScreen({
    super.key,
    required this.isLoggedIn,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    isLoggedIn = widget.isLoggedIn;
    context.read<SettingsCubit>().loadAll(); // حمل الكل معًا: ثيم، لغة، مستخدم
  }

  @override
  Widget build(BuildContext context) {
    final _ = context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr()),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SettingsError) {
            return Center(child: Text(state.error));
          } else if (state is SettingsSuccess) {
            return SettingsBody(
              isLoggedIn: isLoggedIn, 
              user: state.user,
              theme: state.theme,
              locale: state.locale,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
