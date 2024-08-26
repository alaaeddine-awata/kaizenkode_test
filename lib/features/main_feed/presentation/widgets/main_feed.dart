import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizenkode_test/core/assets_manager.dart';
import 'package:kaizenkode_test/core/functions.dart';
import 'package:kaizenkode_test/core/routes_manager.dart';
import 'package:kaizenkode_test/features/main_feed/presentation/controllers/bottom_nav_bar_controller.dart';
import 'package:kaizenkode_test/features/widgets/icon.dart';

class MainFeedView extends ConsumerWidget {
  final Widget child;

  const MainFeedView({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: (AppRouter.router.location == RoutesPaths.homeRoute) ||
                        (AppRouter.router.location == RoutesPaths.chatRoute) ||
                        (AppRouter.router.location ==
                            RoutesPaths.searchRoute) ||
                        (AppRouter.router.location == RoutesPaths.profileRoute)
                    ? 50
                    : 0),
            child: child,
          ),
          Visibility(
            visible: (AppRouter.router.location == RoutesPaths.homeRoute) ||
                (AppRouter.router.location == RoutesPaths.chatRoute) ||
                (AppRouter.router.location == RoutesPaths.searchRoute) ||
                (AppRouter.router.location == RoutesPaths.profileRoute),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CupertinoTabBar(
                  border: const Border(),
                  currentIndex: ref.watch(bottomNavBarProvider),
                  onTap: (index) {
                    if (index.tabPath != RoutesPaths.createPostRoute) {
                      context.goNamed(index.tabPath);
                      ref.read(bottomNavBarProvider.notifier).setTap(index);
                    } else {
                      context.pushNamed(index.tabPath);
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: IconWidget(
                            isPrimary: ref.watch(bottomNavBarProvider).isHome,
                            icon: IconAssets.home),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: IconWidget(
                            isPrimary: ref.watch(bottomNavBarProvider).isSearch,
                            icon: IconAssets.search),
                        label: 'Search'),
                    const BottomNavigationBarItem(
                        icon:
                            IconWidget(isPrimary: false, icon: IconAssets.add),
                        label: 'Add'),
                    BottomNavigationBarItem(
                        icon: IconWidget(
                            isPrimary: ref.watch(bottomNavBarProvider).isChat,
                            icon: IconAssets.messages),
                        label: 'Chat'),
                    BottomNavigationBarItem(
                        icon: IconWidget(
                            isPrimary:
                                ref.watch(bottomNavBarProvider).isProfile,
                            icon: IconAssets.profile),
                        label: 'Profile'),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
