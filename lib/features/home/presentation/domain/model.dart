class Post {
  final FeedType feedType;
  final Topic topic;
  final String authorName;
  final String date;
  final String description;
  final String? image; // Optional
  final String authorImage;

  Post({
    required this.feedType,
    required this.topic,
    required this.authorName,
    required this.date,
    required this.description,
    this.image,
    required this.authorImage,
  });
}

enum FeedType { public, business }

enum Topic { topic1, topic2, topic3 }
