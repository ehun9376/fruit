import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fruit/api_service/api_service.dart';
import 'package:fruit/auth/auth_store.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/model/coupon/coupon_history_model.dart';
import 'package:fruit/model/coupon/coupon_model.dart';
import 'package:fruit/model/point_history/point_history.dart';
import 'package:fruit/shared_preferences_key.dart';
import 'package:fruit/widget/snack/snackbar_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUserEnvironmentModel extends ChangeNotifier {
  AppUser? _currentUser;
  AppUser? get currentUser => _currentUser;
  set currentUser(AppUser? newValue) {
    _currentUser = newValue;

    notifyListeners();

    //存在local，下次開啟app時，可以直接取得
    SharedPreferences.getInstance().then((value) {
      if (newValue != null) {
        value.setString(SharedPreferenceKey.appUser,
            jsonEncode(newValue.toJson(isEncryptPassword: false)));
      } else {
        value.remove(SharedPreferenceKey.appUser);
      }

      loadUserPointHistory();
    });
  }

  PointHistoryModel? _pointHistory;
  PointHistoryModel? get pointHistory => _pointHistory;
  set pointHistory(PointHistoryModel? newValue) {
    _pointHistory = newValue;
    notifyListeners();
  }

  List<CouponModel>? _couponHistory;
  List<CouponModel>? get couponHistory => _couponHistory;
  set couponHistory(List<CouponModel>? newValue) {
    _couponHistory = newValue;
    notifyListeners();
  }

  Future<void> loadUserPointHistory() async {
    ApiService.getPointHistory().then((value) {
      if (value.errorMessage != null) {
        showAppSnackBar("error: ${value.errorMessage}");
      } else {
        pointHistory = value.model;
      }
    });
  }
}
