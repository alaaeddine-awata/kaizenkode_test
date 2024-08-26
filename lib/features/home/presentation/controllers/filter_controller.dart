import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/model.dart';

final filterProvider = StateProvider<Topic?>((ref) {
  return null; // No filter by default
});