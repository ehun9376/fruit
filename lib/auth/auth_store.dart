import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit/api_service/api_service.dart';
import 'package:fruit/config.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/service/firebase_auth/firebase_auth_store.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:fruit/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

ApiService apiService = getIt<ApiService>();

class AuthStore {
  ///一般註冊: 先跟Firebase取得UserCredential, 再將UserCredential轉成AppUser, 最後將AppUser傳給ApiService
  static Future<Result<AppUser>> regis(
      {required String email,
      required String password,
      required String name,
      String? address}) async {
    var user =
        AppUser(email: email, password: password, name: name, address: address);
    var appUserResult = await ApiService.regisUser(user);

    if (appUserResult.errorMessage != null) {
      return Result<AppUser>(
          model: null, errorMessage: appUserResult.errorMessage);
    }

    return Result<AppUser>(model: user, errorMessage: null);
  }

  ///信件登入： 呼叫Firebsae寄連結信，透過連結登入取得UserCredential，轉成AppUser傳給ApiService
  static sendEmailLink(
      String email, Function(String? errorMessage) didSend) async {
    if (email.toLowerCase() == storeReviewerEmail) {
      //Reviewer
      loginWithReviewer();
    } else {
      FirebaseAuthStroe.signInWithFireBaseEmailLink(email, didSend);
    }
  }

  static signinWithEmailLink(UserCredential userCredential) async {
    var loginUser = conventCredentialToAppUser(userCredential);

    var appUserResult = await ApiService.loginUser(loginUser);

    var appUser = appUserResult.model;

    if (appUser != null) {
      getIt<AppUserEnvironmentModel>().currentUser = appUser;
    }
  }

  static Future<AppUser> loginWithReviewer() async {
    AppUser user = AppUser(email: storeReviewerEmail, password: "AAAAAA");
    getIt<AppUserEnvironmentModel>().currentUser = user;

    var appUserResult = await normalSignin(appUser: user);

    return appUserResult.model ?? user;
  }

  //Google登入： 透過Google登入取得UserCredential，轉成AppUser傳給ApiService
  static Future<Result<AppUser>> signinWithGoogle() async {
    var result = await getIt<FirebaseAuthStroe>().signInWithGoogle();
    if (result.errorMessage != null) {
      return Result<AppUser>(model: null, errorMessage: result.errorMessage);
    } else {
      AppUser loginUser = conventCredentialToAppUser(result.model);

      var appUserResult = await normalSignin(appUser: loginUser);

      return Result<AppUser>(
          model: appUserResult.model, errorMessage: appUserResult.errorMessage);
    }
  }

  //Apple登入：透過Apple登入取得UserCredential，轉成AppUser傳給ApiService
  static Future<Result<AppUser>> signinWithApple() async {
    var result = await getIt<FirebaseAuthStroe>().signInWithApple();
    if (result.errorMessage != null) {
      return Result<AppUser>(model: null, errorMessage: result.errorMessage);
    } else {
      AppUser loginUser = conventCredentialToAppUser(result.model);

      var appUserResult = await normalSignin(appUser: loginUser);

      return Result<AppUser>(
          model: appUserResult.model, errorMessage: appUserResult.errorMessage);
    }
  }

  ///自動登入，將存在SharedPreferences的AppUser傳給ApiService
  static Future<Result<AppUser>?> autoLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? appUserJson =
        sharedPreferences.getString(SharedPreferenceKey.appUser);

    if (appUserJson == null || appUserJson.isEmpty || appUserJson == "null") {
      return null;
    }

    debugPrint(appUserJson);

    AppUser appUser = AppUser.fromJson(jsonDecode(appUserJson));

    Result<AppUser> result = await AuthStore.normalSignin(appUser: appUser);
    if (result.errorMessage != null) {
      return Result<AppUser>(errorMessage: result.errorMessage, model: null);
    }
    return Result<AppUser>(
        errorMessage: result.errorMessage, model: result.model);
  }

  ///一般登入:
  static Future<Result<AppUser>> normalSignin(
      {required AppUser appUser}) async {
    var user = AppUser(email: appUser.email, password: appUser.password);
    var appUserResult = await ApiService.loginUser(user);

    if (appUserResult.errorMessage != null) {
      return Result<AppUser>(
          model: null, errorMessage: appUserResult.errorMessage);
    }

    return Result<AppUser>(model: user, errorMessage: null);
  }

  ///將Firebase登入取得的使用者資料轉成Server要的格式
  static AppUser conventCredentialToAppUser(UserCredential? credential) {
    User? userFromFirebase = credential?.user;

    AppUser appUser = AppUser(
      email: userFromFirebase?.email ?? "",
      password: userFromFirebase?.uid ?? "",
    );

    return appUser;
  }
}
