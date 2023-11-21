import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  String profilePhotoURL;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profilePhotoURL="",
  });

  toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "profilePhotoURL": profilePhotoURL,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final user = document.data()!;
    return UserModel(
      id: document.id,
      name: user['name'],
      email: user['email'],
      phone: user['phone'],
      profilePhotoURL: user['profilePhotoURL'],
    );
  }
}
