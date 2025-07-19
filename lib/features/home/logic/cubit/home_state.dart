import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required int currentIndex,
    required List<int> navigationStack,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        currentIndex: 0,
        navigationStack: [0],
      );
}
