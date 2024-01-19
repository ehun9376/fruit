import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruit/get_it/get_it_service.dart';

class EmailSecureStore {
  static const storageUserEmailAddressKey = 'userEmailAddress';
  final flutterSecureStorage = getIt<FlutterSecureStorage>();

  // email
  Future<void> setEmail(String email) async {
    await flutterSecureStorage.write(
        key: storageUserEmailAddressKey, value: email.toLowerCase());
  }

  Future<void> clearEmail() async {
    await flutterSecureStorage.delete(key: storageUserEmailAddressKey);
  }

  Future<String?> getEmail() async {
    return await flutterSecureStorage.read(key: storageUserEmailAddressKey);
  }
}
