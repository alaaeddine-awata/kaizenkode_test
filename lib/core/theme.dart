import 'package:flutter/cupertino.dart';

import 'color_manager.dart';

CupertinoThemeData lightTheme() {
  return CupertinoThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: CupertinoColors.white,
    barBackgroundColor: CupertinoColors.white,
    primaryColor: ColorManager.primary,
  );
}