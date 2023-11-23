// import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';

class FirestoreStrorage {
  static final storageRef = FirebaseStorage.instance.ref();
  static Future<String> getDiscoverPoster() {
    // log(storageRef.child('discoverProduct/upadtedImage').getDownloadURL().toString());
    return storageRef.child('discoverProduct/upadtedImage').getDownloadURL();
  }
}
