import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  toJson() {
    return {"name": name, "email": email, "phone": phone};
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    final user = document.data()!;
    return UserModel(
      id: document.id,
      name: user['name'],
      email: user['email'],
      phone: user['phone'],
    );
  }
}
