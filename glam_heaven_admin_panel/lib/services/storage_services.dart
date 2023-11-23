import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class ProductStorage {
  static final storageRef = FirebaseStorage.instance.ref();

  static Future<String> uploadProductImage(
      Uint8List file, String productName, String extension) async {
    await storageRef
        .child('productFile/$productName')
        .putData(file, SettableMetadata(contentType: "image/$extension"));
    return storageRef.child('productFile/$productName').getDownloadURL();
  }

  static Future<String> uploadDiscoverPoster(Uint8List data, String extension) {
    storageRef
        .child('discoverProduct/upadtedImage')
        .putData(data, SettableMetadata(contentType: "image/$extension"));
    return storageRef.child('discoverProduct/upadtedImage').getDownloadURL();
  }
}
