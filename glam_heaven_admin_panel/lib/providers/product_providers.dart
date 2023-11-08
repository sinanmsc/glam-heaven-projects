import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFreeDeliverProvider = StateProvider<bool>((ref) {
  return true;
});

final categoryProvider = StateProvider<String>((ref) {
  return 'Men';
});
