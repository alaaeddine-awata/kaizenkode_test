import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBarManager extends StateNotifier<int> {
  BottomNavBarManager() : super(0);

  void setTap(int index) => state = index;
}

final bottomNavBarProvider = StateNotifierProvider<BottomNavBarManager, int>(
  (ref) {
    return BottomNavBarManager();
  },
);
