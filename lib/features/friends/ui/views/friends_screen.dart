import 'package:flutter/material.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/core/models/user/user_model.dart';
class FriendsScreen extends StatelessWidget {
  final bool isLoggedIn;
  final UserModel? user;

  const FriendsScreen({
    super.key,
    required this.isLoggedIn,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Logged in: $isLoggedIn, Name: ${user?.username ?? "Guest"}'),
             ElevatedButton(onPressed: (){
              context.pushNamed(Routes.phoneInputScreen);
            }, child: Text( 'Login'))
          ],
        ),
      ),
    );
  }
}
