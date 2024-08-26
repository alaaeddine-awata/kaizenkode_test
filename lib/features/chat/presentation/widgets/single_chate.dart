import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizenkode_test/core/assets_manager.dart';
import 'package:kaizenkode_test/core/functions.dart';
import 'package:kaizenkode_test/features/chat/domain/model.dart';
import 'package:kaizenkode_test/features/widgets/icon.dart';

import '../../../../core/color_manager.dart';
import '../../../../i18n/strings.g.dart';

class SingleChatView extends StatelessWidget {
  final MessageModel messageModel;

  const SingleChatView({super.key, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    List<MessageModel> data = [
      MessageModel(
          senderName: 'Author 1',
          date: DateTime.now().toIso8601String(),
          description: 'This is a public message',
          senderImage: ImageAssets.smallImage,
          messagesCount: 5),
      MessageModel(
          senderName: 'Author 3',
          date: DateTime.now().toIso8601String(),
          description: 'This is a public message',
          senderImage: ImageAssets.smallImage,
          messagesCount: 2),
      MessageModel(
          senderName: 'Author 3',
          date: DateTime.now().toIso8601String(),
          description: 'This is a public message',
          senderImage: ImageAssets.smallImage,
          messagesCount: 3),
      MessageModel(
          senderName: 'Author 3',
          date: DateTime.now().toIso8601String(),
          description: 'This is a public message',
          senderImage: ImageAssets.smallImage,
          messagesCount: 3),
      MessageModel(
          senderName: 'Author 1',
          date: DateTime.now().toIso8601String(),
          description: 'This is a public message',
          senderImage: ImageAssets.smallImage,
          messagesCount: 3),
      MessageModel(
          senderName: 'Author 1',
          date: DateTime.now().toIso8601String(),
          description: 'This is a public message',
          senderImage: ImageAssets.smallImage,
          messagesCount: 3),
      MessageModel(
          senderName: 'Author 1',
          date: DateTime.now().toIso8601String(),
          description: 'This is a public message',
          senderImage: ImageAssets.smallImage,
          messagesCount: 3,
          image: ImageAssets.largeImage),
      MessageModel(
          senderName: 'Author 3',
          date: DateTime.now().toIso8601String(),
          description: '',
          senderImage: ImageAssets.smallImage,
          messagesCount: 3,
          image: ImageAssets.largeImage),
    ];
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: IconWidget(
                          icon: IconAssets.back,
                          isPrimary: false,
                        )),
                    Text(
                      messageModel.senderName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: IconWidget(
                          icon: IconAssets.setting,
                          isPrimary: false,
                        )),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
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
                  CupertinoButton(child: IconWidget(isPrimary: false, icon: IconAssets.image), onPressed: (){}),
                  Expanded(child: CupertinoTextField(placeholder: t.typeSomething,placeholderStyle: TextStyle(fontSize: 10,color: ColorManager.black),decoration: BoxDecoration(border: Border()),)),
                  CupertinoButton(child: IconWidget(isPrimary: true, icon: IconAssets.bxsSend), onPressed: (){}),
                ],
              )
            ],
          )),
    );
  }
}

class MessageBubble extends StatefulWidget {
  final MessageModel message;
  final bool amIPreviousSender;
  final bool myMessage;

  const MessageBubble({
    super.key,
    required this.message,
    required this.amIPreviousSender,
    required this.myMessage,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.myMessage ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          visible: widget.myMessage,
          child: Row(
            children: [
              ClipOval(
                  child: Image.asset(
                widget.message.senderImage,
                height: 36,
              )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: widget.myMessage
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: widget.amIPreviousSender ? 10 : 16,
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.skyBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                      visible: widget.message.image != null,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          widget.message.image ?? '',
                          height: 164,
                          fit: BoxFit.fill,
                        ),
                      )),
                  Visibility(
                    visible: widget.message.description.isNotEmpty,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: widget.message.image != null ? 8 : 0,
                      ),
                      child: Text(
                        widget.message.description,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Text(
                    widget.message.date.getDateFormat,
                    style: TextStyle(
                        color: ColorManager.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: !widget.myMessage,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              ClipOval(
                  child: Image.asset(
                widget.message.senderImage,
                height: 36,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
