import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_admin_panel/model/product_model.dart';
import 'package:glam_heaven_admin_panel/services/product_firestore.dart';

final productFirestoreProvider = Provider<ProductFireStore>((ref) {
  return ProductFireStore();
});

final addProductProvider = FutureProvider.family<
    DocumentReference<ProductModelClass>,
    ProductModelClass>((ref, product) async {
  return ProductFireStore.addProduct(product);
});

final getDetailsProvider =
    StreamProvider<QuerySnapshot<ProductModelClass>>((ref) {
  return ProductFireStore.readData();
});

final upadateDataProvider =
    FutureProvider.family<void, ProductModelClass>((ref, product) async {
  return await ProductFireStore.upadteData(product);
});

final deleteDataProvider =
    FutureProvider.family<void, String>((ref, productId) async {
  return ProductFireStore.deleteData(productId);
});
