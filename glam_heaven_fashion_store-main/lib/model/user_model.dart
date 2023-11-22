import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String name;
  String? imageUrl;
  String email;

  UserModel({
    required this.email,
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
        email: data?['email'],
        id: snapshot.id,
        imageUrl: data?['imageUrl'],
        name: data?['name']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
    };
  }
}
