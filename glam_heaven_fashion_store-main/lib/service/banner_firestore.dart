import 'package:cloud_firestore/cloud_firestore.dart';

class BannerFireStore{
  static Future<QuerySnapshot<Map<String, dynamic>>> readBanner() {
    return FirebaseFirestore.instance.collection('banner').get();
  }
}