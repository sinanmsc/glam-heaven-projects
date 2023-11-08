
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final imagePathProvider = StateProvider<File?>((ref) {
  return null;
});

final webImageProvider = StateProvider<Uint8List?>((ref) {
  return null;
});

final imageExtensionProvider = StateProvider<String?>((ref) {
  return null ;
});