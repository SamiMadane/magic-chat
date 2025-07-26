import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:magicchat/features/home/data/model/user_model.dart';

part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.loaded({
    UserModel? user,              // يمكن null لو مش مسجل دخول
    required bool isLoggedIn,     // يوضح حالة تسجيل الدخول
    required int currentIndex,
    required List<int> navigationStack,
  }) = HomeLoaded;

  const factory HomeState.error(String message) = HomeError;
}

