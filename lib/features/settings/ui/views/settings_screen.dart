import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/features/home/data/model/user_model.dart';
import 'package:magicchat/features/settings/ui/widgets/settings_body.dart';

class SettingsScreen extends StatefulWidget {
  final bool isLoggedIn;
  final UserModel? user;

  const SettingsScreen({
    super.key,
    required this.isLoggedIn,
    required this.user,
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
  }

  @override
  Widget build(BuildContext context) {
    final _ = context.locale;
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr()),
      ),
      body: SettingsBody(
        isLoggedIn: isLoggedIn,
        user: widget.user,
      ),
    );
  }
}
