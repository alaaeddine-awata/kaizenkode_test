import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kaizenkode_test/core/functions.dart';

import '../../../../core/color_manager.dart';
import '../../domain/model.dart';

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

class _MessageBubbleState extends State<MessageBubble>{
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                      visible: widget.message.image != null,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Builder(builder: (context) {
                          if (widget.message.image?.contains('assets') ??
                              false) {
                            return Image.asset(
                              widget.message.image ?? '',
                              height: 164,
                              fit: BoxFit.fill,
                            );
                          } else {
                            return Image.file(
                              File(widget.message.image ?? ''),
                              height: 164,
                              fit: BoxFit.fill,
                            );
                          }
                        }),
                      )),
                  Visibility(
                    visible: widget.message.description.isNotEmpty,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: widget.message.image != null ? 8 : 0,
                      ),
                      child: Text(
                        widget.message.description,
                        style: const TextStyle(
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