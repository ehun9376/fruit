import 'package:fruit/encrypt/encrypt.dart';

class AppUser {
  String? id;
  String? email;
  String? password;
  String? name;
  String? address;
  int? point;

  String? get encryptPassword => password?.encryptMD5();

  AppUser(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.address,
      this.point});

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['_id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      address: json['address'],
      point: json['point'],
    );
  }

  Map<String, dynamic> toJson({required bool isEncryptPassword}) {
    return {
      'id': id,
      'email': email,
      'password': isEncryptPassword ? encryptPassword : password,
      'name': name,
      'address': address,
      'point': point,
    };
  }
}
