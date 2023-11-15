class UserModel {
  String id;
  String name;
  String imageUrl;
  String email;

  UserModel({
    required this.email,
    required this.id,
    required this.imageUrl,
    required this.name,
  });
}

// factory