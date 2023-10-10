class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  toJson() {
    return {"name": name, "email": email, "phone": phone, "password": password};
  }
}
