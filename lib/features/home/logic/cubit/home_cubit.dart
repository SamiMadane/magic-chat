import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/features/user/data/repo/user_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UserRepository userRepository;

  HomeCubit({required this.userRepository}) : super(const HomeState.initial());

  void onTabTapped(int index) {
    if (state is HomeLoaded) {
      final loaded = state as HomeLoaded;
      if (index != loaded.currentIndex) {
        final newStack = List<int>.from(loaded.navigationStack)..add(index);
        emit(HomeState.loaded(
          user: loaded.user,
          isLoggedIn: loaded.user != null,
          currentIndex: index,
          navigationStack: newStack,
        ));
      }
    }
  }

  Future<bool> onWillPop() async {
    if (state is HomeLoaded) {
      final loaded = state as HomeLoaded;
      if (loaded.navigationStack.length > 1) {
        final newStack = List<int>.from(loaded.navigationStack)..removeLast();
        emit(HomeState.loaded(
          user: loaded.user,
          isLoggedIn: loaded.user != null,
          currentIndex: newStack.last,
          navigationStack: newStack,
        ));
        return false;
      }
    }
    return true;
  }

  void checkUserLoginStatus() async {
    emit(const HomeState.loading());

    final phone = await SharedPrefHelper.getString('user_phone');

    if (phone.isNotEmpty == true) {
      try {
        // نبدأ الاشتراك في الستريم
        userRepository.getUserDataByPhone().listen((result) {
          result.when(
            success: (userData) {
              emit(HomeState.loaded(
                user: userData,
                isLoggedIn: true,
                currentIndex: 0,
                navigationStack: [0],
              ));
            },
            failure: (errorKey) {
              emit(HomeState.error(errorKey.tr()));
            },
          );
        });
      } catch (e) {
        emit(HomeState.error('errors.unexpected'.tr()));
      }
    } else {
      // مستخدم لم يسجل من قبل
      emit(const HomeState.loaded(
        user: null,
        isLoggedIn: false,
        currentIndex: 0,
        navigationStack: [0],
      ));
    }
  }
}
