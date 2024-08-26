import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaizenkode_test/core/color_manager.dart';

class IconWidget
    extends StatelessWidget {
  final String icon;
  final bool isPrimary;
  final Color? primaryColor;

  const IconWidget({super.key, required this.isPrimary, required this.icon, this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: isPrimary
          ? primaryColor ?? CupertinoTheme.of(context).primaryColor
          : ColorManager.black,
    );
  }
}