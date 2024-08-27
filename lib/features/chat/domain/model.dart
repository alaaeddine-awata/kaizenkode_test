class MessageModel {
  final String senderName;
  final String date;
  final String description;
  int? messagesCount; // Optional
  final String senderImage;
  final String? image;

  MessageModel({
    required this.senderName,
    required this.date,
    required this.description,
    this.messagesCount,
    required this.senderImage,
    this.image,
  });
}
