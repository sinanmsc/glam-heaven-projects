import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glam_heaven_fashion_store/model/user_model.dart';

class FirestoreService {
  static final converter =
      FirebaseFirestore.instance.collection('userDetails').withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (UserModel value, options) => value.toFirestore(),
          );

  static Future<void> addUser(UserModel user) {
    return converter.doc(user.id).set(user);
  }

  static Future<DocumentSnapshot<UserModel>> readUserData(String uid) {
    var result = converter.doc(uid).get();
    log(result.toString());
    return result;
  }

 
}
