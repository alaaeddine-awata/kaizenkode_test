import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaizenkode_test/core/assets_manager.dart';
import '../domain/model.dart';
import '../../../../core/functions.dart';

final postProvider = StateNotifierProvider<PostNotifier, List<Post>>((ref) {
  return PostNotifier();
});

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super([
    // Initial posts for Public Feed
    Post(
      feedType: FeedType.public,
      topic: Topic.topic1,
      authorName: 'Author 1',
      date: DateTime.now().toIso8601String(),
      description: 'This is a public post',
      image: null,
      authorImage: ImageAssets.smallImage,
    ),
    Post(
      feedType: FeedType.public,
      topic: Topic.topic2,
      authorName: 'Author 2',
      date: DateTime.now().toIso8601String(),
      description: 'Another public post',
      image: null,
      authorImage: ImageAssets.smallImage,
    ),
    Post(
      feedType: FeedType.public,
      topic: Topic.topic3,
      authorName: 'Author 3',
      date: DateTime.now().toIso8601String(),
      description: 'More public posts',
      image: ImageAssets.largeImage,
      authorImage: ImageAssets.smallImage,
    ),
    // Initial posts for Business Feed
    Post(
      feedType: FeedType.business,
      topic: Topic.topic1,
      authorName: 'Business Author 1',
      date: DateTime.now().toIso8601String(),
      description: 'This is a business post',
      image: null,
      authorImage: ImageAssets.smallImage,
    ),
    Post(
      feedType: FeedType.business,
      topic: Topic.topic2,
      authorName: 'Business Author 2',
      date: DateTime.now().toIso8601String(),
      description: 'Another business post',
      image: null,
      authorImage: ImageAssets.smallImage,
    ),
    Post(
      feedType: FeedType.business,
      topic: Topic.topic3,
      authorName: 'Business Author 3',
      date: DateTime.now().toIso8601String(),
      description: 'More business posts',
      image: ImageAssets.largeImage,
      authorImage: ImageAssets.smallImage,
    ),
  ]);

  void addPost(Post post) {
    state = [...state, post];
  }

  List<Post> getPostsByFeedType(FeedType feedType) {
    return state.where((post) => post.feedType == feedType).toList();
  }

  List<Post> getPostsByFeedTypeAndTopic(FeedType feedType, Topic topic) {
    return state
        .where((post) => post.feedType == feedType && post.topic == topic)
        .toList();
  }
}