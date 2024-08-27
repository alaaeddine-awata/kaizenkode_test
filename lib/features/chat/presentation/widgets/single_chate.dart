import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizenkode_test/core/assets_manager.dart';
import 'package:kaizenkode_test/core/functions.dart';
import 'package:kaizenkode_test/features/chat/domain/model.dart';
import 'package:kaizenkode_test/features/widgets/icon.dart';
import '../../../../core/color_manager.dart';
import '../../../../i18n/strings.g.dart';
import 'message_bubble.dart';

class SingleChatView extends StatefulWidget {
  final MessageModel messageModel;

  const SingleChatView({super.key, required this.messageModel});

  @override
  State<SingleChatView> createState() => _SingleChatViewState();
}

class _SingleChatViewState extends State<SingleChatView> {
  List<MessageModel> data = [];
  TextEditingController messageText = TextEditingController();
  File? image;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    messageText.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    data = [
      MessageModel(
        senderName: 'Author 1',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
      ),
      MessageModel(
        senderName: 'Author 3',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
      ),
      MessageModel(
        senderName: 'Author 3',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
      ),
      MessageModel(
        senderName: 'Author 3',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
      ),
      MessageModel(
        senderName: 'Author 1',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
      ),
      MessageModel(
        senderName: 'Author 1',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
      ),
      MessageModel(
          senderName: 'Author 1',
          date: DateTime.now().toIso8601String(),
          description: 'This is a public message',
          senderImage: ImageAssets.smallImage,
          image: ImageAssets.largeImage),
      MessageModel(
          senderName: 'Author 3',
          date: DateTime.now().toIso8601String(),
          description: '',
          senderImage: ImageAssets.smallImage,
          image: ImageAssets.largeImage),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 20),
            child: Row(
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
                  widget.messageModel.senderName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                    onTap: () {},
                    child: const IconWidget(
                      icon: IconAssets.setting,
                      isPrimary: false,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: data.length,
            itemBuilder: (context, index) => MessageBubble(
                message: data[index],
                amIPreviousSender: index != 0
                    ? data[index - 1].senderName == 'Author 1'
                    : false,
                myMessage: data[index].senderName == 'Author 1'),
          )),
          Row(
            children: [
              Builder(builder: (context) {
                if (image != null) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            image ?? File(''),
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        PositionedDirectional(
                            end: 0,
                            child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: const Icon(
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
                  );
                } else {
                  return CupertinoButton(
                      child: const IconWidget(
                          isPrimary: false, icon: IconAssets.image),
                      onPressed: () {
                        addImage().then(
                          (value) {
                            if (value != null) {
                              setState(() {
                                image = File(value.path);
                              });
                            }
                          },
                        );
                      });
                }
              }),
              Expanded(
                  child: CupertinoTextField(
                controller: messageText,
                placeholder: t.typeSomething,
                placeholderStyle:
                    TextStyle(fontSize: 10, color: ColorManager.black),
                decoration: const BoxDecoration(border: Border()),
              )),
              CupertinoButton(
                  child: const IconWidget(
                      isPrimary: true, icon: IconAssets.bxsSend),
                  onPressed: () {
                    if (messageText.text.isNotEmpty || image != null) {
                      setState(() {
                        data.add(
                          MessageModel(
                              senderName: 'Author 1',
                              date: DateTime.now().toIso8601String(),
                              description: messageText.text,
                              senderImage: ImageAssets.smallImage,
                              image: image?.path),
                        );
                        scrollController.animateTo(
                            scrollController.position.maxScrollExtent +
                                MediaQuery.of(context).viewInsets.bottom +
                                75,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                        messageText.clear();
                        image = null;
                      });
                    }
                  }),
            ],
          )
        ],
      )),
    );
  }
}
