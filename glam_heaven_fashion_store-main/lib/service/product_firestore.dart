import 'package:cloud_firestore/cloud_firestore.dart';

class GlameProducts {
  static FirebaseFirestore auth = FirebaseFirestore.instance;
  static const a = '';
  static Future<QuerySnapshot<Map<String, dynamic>>> readProducts(
      String where, String isEqualTo) {
    return auth
        .collection('glamAllData')
        .where(where, isEqualTo: isEqualTo)
        .get();
  }
}
