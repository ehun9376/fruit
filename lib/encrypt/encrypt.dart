import 'package:crypto/crypto.dart';
import 'dart:convert';

extension Encrypt on String {
  String encryptMD5() {
    final encrypted = md5.convert(utf8.encode(this)).toString();
    return encrypted;
  }
}
