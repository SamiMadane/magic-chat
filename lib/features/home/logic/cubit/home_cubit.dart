import 'package:bloc/bloc.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/features/home/data/repo/user_repo.dart';
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

  Future<void> checkUserLoginStatus() async {
    emit(const HomeState.loading());

    try {
      final phone = await SharedPrefHelper.getString('user_phone');

      if (phone.isNotEmpty == true) {
        final userData = await userRepository.getUserData(phone);

        emit(HomeState.loaded(
          user: userData,
          isLoggedIn: userData != null,
          currentIndex: 0,
          navigationStack: [0],
        ));
      } else {
        // مستخدم لم يسجل من قبل
        emit(const HomeState.loaded(
          user: null,
          isLoggedIn: false,
          currentIndex: 0,
          navigationStack: [0],
        ));
      }
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
