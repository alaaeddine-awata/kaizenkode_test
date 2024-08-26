import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizenkode_test/core/functions.dart';
import 'package:kaizenkode_test/features/home/presentation/controllers/posts_controller.dart';
import 'package:kaizenkode_test/features/home/presentation/domain/model.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/color_manager.dart';
import '../../../../i18n/strings.g.dart';
import '../../../widgets/icon.dart';
import 'create_post_tab_abr.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  FeedType feedType = FeedType.public;
  Topic topic = Topic.topic1;
  TextEditingController desc = TextEditingController();
  String? image;

  // File? image;

  @override
  void dispose() {
    desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const IconWidget(
                      icon: IconAssets.back,
                      isPrimary: false,
                    )),
                Text(
                  t.createPost,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: CupertinoTheme.of(context).primaryColor,
                        onPressed: () {
                          if(desc.text.isNotEmpty) {
                            ref.read(postProvider.notifier).addPost(Post(
                              feedType: feedType,
                              topic: topic,
                              authorName: 'Author 1',
                              date: DateTime.now().toIso8601String(),
                              description: desc.text,
                              authorImage: ImageAssets.smallImage,
                              image: image));
                            context.pop();
                          }else{
                            Fluttertoast.showToast(msg: t.pleaseWriteSomething);
                          }
                        },
                        child: Text(t.post));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: CreatePostCustomTabBarItem(
                  isSelected: feedType == FeedType.public,
                  title: t.public,
                  onTap: () {
                    setState(() {
                      feedType = FeedType.public;
                    });
                  },
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: CreatePostCustomTabBarItem(
                  isSelected: feedType == FeedType.business,
                  title: t.business,
                  onTap: () {
                    setState(() {
                      feedType = FeedType.business;
                    });
                  },
                )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Material(
              color: CupertinoColors.white,
              child: TextField(
                decoration: InputDecoration(
                    hintText: t.typeSomething,
                    hintStyle:
                        TextStyle(color: ColorManager.black, fontSize: 14),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
                controller: desc,
                maxLines: 5,
                cursorColor: ColorManager.black,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            const Spacer(),
            Text(t.topic),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 32,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CreatePostCustomTabBarItem(
                        onTap: () {
                          setState(() {
                            topic = Topic.values[index];
                          });
                        },
                        title: Topic.values[index].name,
                        isSelected: topic == Topic.values[index],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 12,
                      ),
                  itemCount: Topic.values.length),
            ),
            Visibility(
                visible: image != null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 19),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          image ?? '',
                          height: 114,
                          fit: BoxFit.fill,
                        ),
                      ),
                      PositionedDirectional(
                          end: 0,
                          child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Icon(
                                CupertinoIcons.delete,
                                color: CupertinoColors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  image = null;
                                });
                              }))
                    ],
                  ),
                )),
            Visibility(
              visible: image == null,
              child: Row(
                children: [
                  CupertinoButton(
                      child: const IconWidget(
                          isPrimary: false, icon: IconAssets.camera),
                      onPressed: () {
                        setState(() {
                          image = ImageAssets.largeImage;
                        });
                        // takePhoto().then(
                        //   (value) {
                        //     if (value != null) {
                        //       setState(() {
                        //         image = File(value.path);
                        //       });
                        //     }
                        //   },
                        // );
                      }),
                  CupertinoButton(
                      child: const IconWidget(
                          isPrimary: false, icon: IconAssets.galleryAdd),
                      onPressed: () {
                        setState(() {
                          image = ImageAssets.largeImage;
                        });
                        // addImage().then(
                        //   (value) {
                        //     if (value != null) {
                        //       setState(() {
                        //         image = File(value.path);
                        //       });
                        //     }
                        //   },
                        // );
                      }),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
