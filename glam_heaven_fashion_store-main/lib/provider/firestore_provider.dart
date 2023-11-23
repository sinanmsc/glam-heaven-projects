import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/model/user_model.dart';
import 'package:glam_heaven_fashion_store/service/banner_firestore.dart';
import 'package:glam_heaven_fashion_store/service/user_details_firestore.dart';

//adding user when authanticate

final addUserProvider =
    FutureProvider.family<void, UserModel>((ref, user) async {
  return FirestoreService.addUser(user);
});

final readUserProvider =
    FutureProvider.family<DocumentSnapshot<UserModel>, String>(
        (ref, uid) async {
  return FirestoreService.readUserData(uid);
});

final profileUrlProvider = StateProvider<String?>((ref) {
  return null;
});

//get banner dara

final readBannerProvider =
    FutureProvider<QuerySnapshot<Map<String, dynamic>>>((ref) async {
  return BannerFireStore.readBanner();
});

//for get products of brand

final brandNameProvider = StateProvider<String>((ref) {
  return 'Nike';
});
