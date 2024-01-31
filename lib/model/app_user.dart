import 'package:fruit/aes/aes.dart';

class AppUser {
  String? email;
  String? password;
  String? name;
  String? address;

  String? get encryptPassword => password?.encryptMD5();

  AppUser({
    this.email,
    this.password,
    this.name,
    this.address,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson({required bool isEncryptPassword}) {
    return {
      'email': email,
      'password': isEncryptPassword ? encryptPassword : password,
      'name': name,
      'address': address,
    };
  }
}
