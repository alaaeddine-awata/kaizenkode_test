class MessageModel {
  final String senderName;
  final String date;
  final String description;
  final int messagesCount; // Optional
  final String senderImage;
  final String? image;

  MessageModel({
    required this.senderName,
    required this.date,
    required this.description,
    required this.messagesCount,
    required this.senderImage,
    this.image,
  });
}
