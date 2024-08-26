import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizenkode_test/core/color_manager.dart';
import 'package:kaizenkode_test/core/functions.dart';
import 'package:kaizenkode_test/core/routes_manager.dart';
import 'package:kaizenkode_test/features/chat/domain/model.dart';
import 'package:kaizenkode_test/features/chat/presentation/controllers/chat_controller.dart';

import '../../../../core/assets_manager.dart';
import '../../../../i18n/strings.g.dart';
import '../../../widgets/icon.dart';

class ChatView extends ConsumerWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.message,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Icon(
                      CupertinoIcons.add_circled,
                      color: ColorManager.black,
                    ))
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ChatItem(message: ref.watch(messageProvider)[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: ref.watch(messageProvider).length),
            )
          ],
        ),
      )),
    );
  }
}

class ChatItem extends StatelessWidget {
  final MessageModel message;

  const ChatItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.goNamed(RoutesPaths.singleChatRoute,extra: message);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.skyBlue,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding:
          const EdgeInsetsDirectional.only(start: 16,end: 10,top: 14,bottom: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                  child: Image.asset(
                    message.senderImage,
                    height: 36,
                  )),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.senderName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      message.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          message.date.getDateFormat,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                        Row(
                          children: [
                            Text(message.messagesCount.toString()),
                            const SizedBox(width: 6,),
                            const IconWidget(
                                isPrimary: false, icon: IconAssets.message),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
