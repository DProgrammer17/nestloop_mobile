import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/features/bottom_nav/state/bottom_nav_model.dart';

final bottomNavNotifier = NotifierProvider<BottomNavNotifier, BottomNavModel>(
  () {
    return BottomNavNotifier();
  },
);

class BottomNavNotifier extends Notifier<BottomNavModel> {
  @override
  build() => const BottomNavModel();

  void updateNavIndex(int index) {
    state = state.copyWith(currentIndex: index);
    matchingIndex(index);
  }

  bool matchingIndex(int index) => index == state.currentIndex;
}
