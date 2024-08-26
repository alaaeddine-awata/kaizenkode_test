import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaizenkode_test/features/home/presentation/domain/model.dart';

final activeTabProvider = StateNotifierProvider<ActiveTabNotifier, FeedType>((ref) {
  return ActiveTabNotifier();
});

class ActiveTabNotifier extends StateNotifier<FeedType> {
  ActiveTabNotifier() : super(FeedType.public);

  void setTab(FeedType tab) {
    state = tab;
  }
}