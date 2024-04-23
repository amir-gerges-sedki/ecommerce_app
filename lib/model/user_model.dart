class UserModel {
  late String userName, phone, email;
  UserModel({required this.email, required this.phone, required this.userName});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    userName = map['userName'];
    phone = map['phone'];
    email = map['email'];
  }

  toJson() {
    return {
      'userName': userName,
      'phone': phone,
      'email': email,
    };
  }
}
