import 'package:bloc/bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    if (index != state.currentIndex) {
      final newStack = List<int>.from(state.navigationStack)..add(index);
      emit(HomeState(currentIndex: index, navigationStack: newStack));
    }
  }

  Future<bool> onWillPop() async {
    if (state.navigationStack.length > 1) {
      final newStack = List<int>.from(state.navigationStack)..removeLast();
      emit(HomeState(currentIndex: newStack.last, navigationStack: newStack));
      return false;
    }
    return true;
  }
}
