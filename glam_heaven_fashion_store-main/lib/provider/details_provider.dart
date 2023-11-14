import 'package:flutter_riverpod/flutter_riverpod.dart';

final readProvider = StateProvider<bool>((ref) {
  return true;
});

final circleProvider = StateProvider<int>((ref) {
  return 1;
});

final pageviewProvider = StateProvider<int>((ref) {
  return 0;
});
