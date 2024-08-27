import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaizenkode_test/core/color_manager.dart';
import 'package:kaizenkode_test/features/home/presentation/widgets/post.dart';

import '../../../../core/assets_manager.dart';
import '../../../../i18n/strings.g.dart';
import '../../../widgets/icon.dart';
import '../controllers/filter_controller.dart';
import '../controllers/posts_controller.dart';
import '../controllers/tab_controller.dart';
import '../domain/model.dart';
import 'bottom_sheet.dart';
import 'tab_bar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeTab = ref.watch(activeTabProvider);
    final posts = ref.watch(postProvider);
    final filter = ref.watch(filterProvider);

    List<Post> filteredPosts;

    // Filter posts based on the active tab and filter topic
    if (filter == null) {
      filteredPosts =
          posts.where((post) => post.feedType == activeTab).toList();
    } else {
      filteredPosts = posts
          .where((post) => post.feedType == activeTab && post.topic == filter)
          .toList();
    }
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          border: const Border(),
          trailing: GestureDetector(onTap: (){},child: const IconWidget(isPrimary: false, icon: IconAssets.bell)),
        ),
        child: Column(
          children: [
            const CustomTabBarView(),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 15)
                    .copyWith(bottom: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.feeds,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: ColorManager.black),),
                        CupertinoButton(
                            child: const IconWidget(
                                isPrimary: false, icon: IconAssets.filter),
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => const FilterBottomSheet(),
                              );
                            }),
                      ],
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async{},
                        child: ListView.separated(
                          itemCount: filteredPosts.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 12,),
                          itemBuilder: (context, index) {
                            final post = filteredPosts[index];
                            return PostItem(post: post);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
