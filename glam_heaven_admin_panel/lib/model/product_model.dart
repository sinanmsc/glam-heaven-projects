import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModelClass {
  String name;
  String brand;
  String image;
  String? id;
  int discountPercentage;
  double discountPrice;
  String discription;
  int favCount;
  int itemCount;
  bool freeDelivery;
  List<String> size;
  int totalRating;
  String type;
  int price;
  String category;

  ProductModelClass({
    required this.name,
    required this.brand,
    required this.image,
    this.id,
    required this.discountPercentage,
    required this.discountPrice,
    required this.discription,
    required this.favCount,
    required this.freeDelivery,
    required this.itemCount,
    required this.price,
    required this.size,
    required this.totalRating,
    required this.type,
    required this.category,
  });

  factory ProductModelClass.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return ProductModelClass(
      name: data?["name"],
      brand: data?['brand'],
      image: data?["image"],
      id: snapshot.id,
      discountPercentage: data?["discountPercentage"],
      discountPrice: data?["discountPrice"],
      discription: data?["discription"],
      favCount: data?["favCount"],
      freeDelivery: data?["freeDelivery"],
      itemCount: data?["itemCount"],
      price: data?["price"],
      size: List<String>.from(data?["size"]),
      totalRating: data?["totalRating"],
      type: data?["type"],
      category: data?["category"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "brand": brand,
      "image": image,
      "id": id,
      "discountPercentage": discountPercentage,
      "discountPrice": discountPrice,
      "discription": discription,
      "favCount": favCount,
      "freeDelivery": freeDelivery,
      "itemCount": itemCount,
      "price": price,
      "size": size,
      "totalRating": totalRating,
      "type": type,
      "category": category,
    };
  }
}
