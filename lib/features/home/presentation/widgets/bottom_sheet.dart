import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaizenkode_test/core/assets_manager.dart';
import 'package:kaizenkode_test/features/home/presentation/domain/model.dart';
import 'package:kaizenkode_test/features/home/presentation/domain/model.dart';
import 'package:kaizenkode_test/features/home/presentation/domain/model.dart';
import 'package:kaizenkode_test/features/widgets/icon.dart';

import '../controllers/filter_controller.dart';

class FilterBottomSheet extends ConsumerWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 28),
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetItem(onTap: (){
            ref.read(filterProvider.notifier).state = null;
            Navigator.of(context).pop();
          },title: 'All Topics',isSelected: filter == null),
          BottomSheetItem(
            isSelected: filter == Topic.topic1,
            title: 'Topic 1',
            onTap: () {
              ref.read(filterProvider.notifier).state = Topic.topic1;
              Navigator.of(context).pop();
            },
          ),
          BottomSheetItem(
            isSelected: filter == Topic.topic2,
            title: 'Topic 2',
            onTap: () {
              ref.read(filterProvider.notifier).state = Topic.topic2;
              Navigator.of(context).pop();
            },
          ),
          BottomSheetItem(
            isSelected: filter == Topic.topic3,
            title: 'Topic 3',
            onTap: () {
              ref.read(filterProvider.notifier).state = Topic.topic3;
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class BottomSheetItem extends StatelessWidget {
 final void Function()? onTap;
 final bool isSelected;
 final String title;
  const BottomSheetItem({super.key, this.onTap, required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? CupertinoTheme.of(context).primaryColor : null,
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            SizedBox(width: 50,child: Center(child: IconWidget(isPrimary: isSelected, icon: IconAssets.topicIcon,primaryColor: CupertinoColors.white,))),
            Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: isSelected ? CupertinoColors.white : null),),
          ],
        ),
      ),
    );
  }
}
