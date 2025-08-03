import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/helpers/app_regex.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/widgets/search_text_field.dart';
import 'package:magicchat/features/friends/logic/cubit/friends_cubit.dart';
import 'package:magicchat/features/friends/ui/widgets/search_result.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<FriendsCubit>().loadContacts();

    _phoneController.addListener(() {
      if (_phoneController.text.trim().isEmpty) {
        context.read<FriendsCubit>().resetSearch();
      }
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onSearch() {
    final input = _phoneController.text.trim();

    final formState = _formKey.currentState;
    if (formState != null && !formState.validate()) {
      return;
    }

    if (input.isEmpty) {
      context.read<FriendsCubit>().resetSearch();
      return;
    }
    context.read<FriendsCubit>().searchFriendByPhone(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('friends.findFriends.find_friend'.tr()),scrolledUnderElevation: 0,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: SearchTextField(
                  controller: _phoneController,
                  label: 'friends.findFriends.enter_phone_number'.tr(),
                  keyboardType: TextInputType.phone,
                  onSearch: _onSearch,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return null; // مسموح يكون فارغ
                    }
                    if (!AppRegex.isPhoneNumberDigitsOnly(val.trim())) {
                      return 'friends.findFriends.invalid_phone_number'.tr();
                    }
                    return null;
                  },
                  autoValidate: false),
            ),
             SizedBox(height: HeightManager.h20),
            const Expanded(child: SearchResults()),
          ],
        ),
      ),
    );
  }
}
