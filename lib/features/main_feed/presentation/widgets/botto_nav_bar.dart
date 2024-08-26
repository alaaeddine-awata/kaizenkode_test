import 'package:flutter/cupertino.dart';

class BottomNavBar extends CupertinoTabBar {
  const BottomNavBar({super.key, required super.items,});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(items: items);
  }
}
