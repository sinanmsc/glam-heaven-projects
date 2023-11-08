import 'package:flutter_riverpod/flutter_riverpod.dart';

final editProvider = StateProvider<bool>((ref) {
  return true;
});
final toggleprovider = StateProvider<int>((ref) => 0);

final brandContainerProvider = StateProvider<int>((ref) {
  return 0;
});

final checkprovider = StateProvider<bool>((ref) {
  return false;
});

final counterprovider = StateProvider<int>((ref) {
  return 1;
});
final filterProvider = StateProvider<int>((ref) {
  return 0;
});
