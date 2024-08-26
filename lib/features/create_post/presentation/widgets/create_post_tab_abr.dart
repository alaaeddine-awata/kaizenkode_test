import 'package:flutter/cupertino.dart';

import '../../../../core/color_manager.dart';

class CreatePostCustomTabBarItem extends StatelessWidget {
  final void Function()? onTap;
  final bool isSelected;
  final String title;

  const CreatePostCustomTabBarItem(
      {super.key, this.onTap, required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 29,
        decoration: BoxDecoration(
          color: isSelected
              ? CupertinoTheme.of(context).primaryColor
              :  CupertinoColors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              width: 1,
              color: isSelected
                  ? CupertinoColors.transparent
                  : ColorManager.black),
        ),
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: isSelected ? CupertinoColors.white : ColorManager.black,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600),
            )),
      ),
    );
  }
}