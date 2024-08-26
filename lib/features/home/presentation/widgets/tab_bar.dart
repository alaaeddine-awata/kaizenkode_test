import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaizenkode_test/core/color_manager.dart';
import 'package:kaizenkode_test/features/home/presentation/domain/model.dart';

import '../../../../i18n/strings.g.dart';
import '../controllers/tab_controller.dart';

class CustomTabBarView extends ConsumerWidget {
  const CustomTabBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            child: CustomTabBarItem(
              isSelected: ref.watch(activeTabProvider) == FeedType.public,
              onTap: () {
                ref.read(activeTabProvider.notifier).setTab(FeedType.public);
              },
              title: t.publicFeed,
            )),
        Expanded(
            child: CustomTabBarItem(
          isSelected: ref.watch(activeTabProvider) == FeedType.business,
          onTap: () {
            ref.read(activeTabProvider.notifier).setTab(FeedType.business);
          },
          title: t.businessFeed,
        )),
      ],
    );
  }
}

class CustomTabBarItem extends StatelessWidget {
  final void Function()? onTap;
  final bool isSelected;
  final String title;

  const CustomTabBarItem(
      {super.key, this.onTap, required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.5,
                color: isSelected
                    ? CupertinoTheme.of(context).primaryColor
                    : CupertinoColors.transparent),
          ),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: isSelected
                  ? CupertinoTheme.of(context).primaryColor
                  : ColorManager.black,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600),
        )),
      ),
    );
  }
}
