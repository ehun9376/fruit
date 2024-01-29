import 'package:encrypt/encrypt.dart';
import 'package:fruit/config.dart';

final key = Key.fromUtf8(aesKey);
final iv = IV.fromLength(16);
final encrypter = Encrypter(AES(key));

extension Aes on String {
  String encryptAES() {
    final encrypted = encrypter.encrypt(this, iv: iv);
    return encrypted.base64;
  }

  String decryptAES() {
    final decrypted = encrypter.decrypt64(this, iv: iv);
    return decrypted;
  }
}
