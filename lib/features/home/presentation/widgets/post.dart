import 'package:flutter/cupertino.dart';
import 'package:kaizenkode_test/core/assets_manager.dart';
import 'package:kaizenkode_test/core/color_manager.dart';
import 'package:kaizenkode_test/core/functions.dart';
import 'package:kaizenkode_test/features/widgets/icon.dart';

import '../domain/model.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.skyBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  const EdgeInsetsDirectional.only(start: 14.0,top: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                            child: Image.asset(
                          post.authorImage,
                          height: 36,
                        )),
                        const SizedBox(
                          width: 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(post.authorName,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Icon(
                                  CupertinoIcons.checkmark_seal_fill,
                                  size: 12,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text('.  ' + post.date.getDateFormat,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 10),)
                              ],
                            ),
                            Text(post.topic.name,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 10),)
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(post.description,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 10),),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                  visible: post.image != null,
                  child: Image.asset(post.image ?? '',fit: BoxFit.fill,width: double.infinity,height: 224,)),
              Row(
                children: [
                  CupertinoButton(child: const IconWidget(isPrimary: false, icon: IconAssets.heart), onPressed: (){},padding: EdgeInsets.zero,),
                  CupertinoButton(child: const IconWidget(isPrimary: false, icon: IconAssets.message), onPressed: (){},padding: EdgeInsets.zero,),
                  CupertinoButton(child: const IconWidget(isPrimary: false, icon: IconAssets.send), onPressed: (){},padding: EdgeInsets.zero,),
                ],
              )
            ],
          ),
          PositionedDirectional(end: 0,top: 0,child:  CupertinoButton(child: const IconWidget(isPrimary: false, icon: IconAssets.threeDots), onPressed: (){}))
        ],
      ),
    );
  }
}
