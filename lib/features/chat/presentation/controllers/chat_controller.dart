import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaizenkode_test/core/assets_manager.dart';
import 'package:kaizenkode_test/features/chat/domain/model.dart';
import '../../../../core/functions.dart';

final messageProvider = StateNotifierProvider<MessageModelNotifier, List<MessageModel>>((ref) {
  return MessageModelNotifier();
});

class MessageModelNotifier extends StateNotifier<List<MessageModel>> {
  MessageModelNotifier() : super([
    MessageModel(
      senderName: 'Author 1',
      date: DateTime.now().toIso8601String(),
      description: 'This is a public message',
      senderImage: ImageAssets.smallImage,
      messagesCount: 5
    ),
    MessageModel(
        senderName: 'Author 2',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
        messagesCount: 2
    ),
    MessageModel(
        senderName: 'Author 3',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
        messagesCount: 3
    ),
    MessageModel(
        senderName: 'Author 4',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
        messagesCount: 3
    ),
    MessageModel(
        senderName: 'Author 1',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
        messagesCount: 3
    ),
    MessageModel(
        senderName: 'Author 1',
        date: DateTime.now().toIso8601String(),
        description: 'This is a public message',
        senderImage: ImageAssets.smallImage,
        messagesCount: 3
    ),
  ]);

  void addMessageModel(MessageModel post) {
    state = [...state, post];
  }
}