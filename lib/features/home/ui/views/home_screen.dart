import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicchat/core/helpers/extensions.dart';
import 'package:magicchat/core/routes/routes.dart';
import 'package:magicchat/features/ai/ui/views/ai_screen.dart';
import 'package:magicchat/features/chatbot/ui/views/chatbot_screen.dart';
import 'package:magicchat/features/friends/ui/views/friends_screen.dart';
import 'package:magicchat/features/home/logic/cubit/home_cubit.dart';
import 'package:magicchat/features/home/logic/cubit/home_state.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.locale;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (user, isLoggedIn, currentIndex, navigationStack) {
            final tabs = [
              FriendsScreen(isLoggedIn: isLoggedIn, user: user),
              const AiScreen(),
              const ChatbotScreen(),
            ];
            return WillPopScope(
              onWillPop: cubit.onWillPop,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('home.app_title'.tr()),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        context.pushNamed(
                          Routes.settingsScreen,
                          arguments: {
                            'isLoggedIn': isLoggedIn,
                            'user': user,
                          },
                        );
                      },
                    ),
                  ],
                ),
                body: IndexedStack(
                  index: currentIndex,
                  children: tabs,
                ),
                bottomNavigationBar: CustomBottomNavBar(
                  currentIndex: currentIndex,
                  onTap: cubit.onTabTapped,
                ),
              ),
            );
          },
          error: (message) => Scaffold(
            body: Center(child: Text('Error: $message')),
          ),
        );
      },
    );
  }
}
