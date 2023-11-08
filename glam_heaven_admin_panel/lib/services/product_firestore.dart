import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glam_heaven_admin_panel/model/product_model.dart';

class ProductFireStore {
  static final converter = FirebaseFirestore.instance
      .collection('glamAllData')
      .withConverter(
        fromFirestore: ProductModelClass.fromFireStore,
        toFirestore: (ProductModelClass value, options) => value.toFirestore(),
      );

  static Stream<QuerySnapshot<ProductModelClass>> readData() {
    return converter.snapshots();
  }

  static Future<DocumentReference<ProductModelClass>> addProduct(
      ProductModelClass product) {
    return converter.add(product);
  }

  static Future<void> upadteData(ProductModelClass product) {
    return converter.doc(product.id).set(product);
  }

  static Future<void> deleteData(String productId) {
    return converter.doc(productId).delete();
  }
}
