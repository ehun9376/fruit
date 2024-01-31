import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppEnvironmentModel extends ChangeNotifier {
  AppUser? _currentUser;
  AppUser? get currentUser => _currentUser;
  set currentUser(AppUser? newValue) {
    _currentUser = newValue;

    notifyListeners();

    SharedPreferences.getInstance().then((value) {
      if (newValue != null) {
        value.setString(SharedPreferenceKey.appUser,
            jsonEncode(newValue.toJson(isEncryptPassword: false)));
      } else {
        value.remove(SharedPreferenceKey.appUser);
      }
    });
  }
}
