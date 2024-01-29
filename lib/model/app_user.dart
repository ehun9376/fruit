import 'package:fruit/aes/aes.dart';

class AppUser {
  String? email;
  String? password;

  AppUser({
    this.email,
    this.password,
  }) {
    email = email;
    password = (password ?? "").encryptAES();
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  getIt() {}
}
