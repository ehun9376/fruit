import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/service/firebase_auth/firebase_auth_store.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:fruit/uti/string_to_enum.dart';

import 'package:uuid/uuid.dart';

enum AuthSource { unknown, email, google, apple, line, facebook }

class AuthStore {
  ///一般註冊: 先跟Firebase取得UserCredential, 再將UserCredential轉成AppUser, 最後將AppUser傳給ApiService
  // static Future<Result<AppUser>> regis(
  //     {required String email,
  //     required String password,
  //     required String name}) async {
  //   var result = await getIt<FirebaseAuthStroe>()
  //       .regisWithEmailAndPassword(email, password);

  //   if (result.errorMessage != null) {
  //     return Result<AppUser>(model: null, errorMessage: result.errorMessage);
  //   } else {
  //     var regisAppUser = conventCredentialToAppUser(result.model);

  //     // var appUserResult = await ApiService.loginUser(regisAppUser);
  //     //login

  //     return Result<AppUser>(
  //         model: appUserResult.model, errorMessage: appUserResult.errorMessage);
  //   }
  // }

  ///信件登入： 呼叫Firebsae寄連結信，透過連結登入取得UserCredential，轉成AppUser傳給ApiService
  static sendEmailLink(
      String email, Function(String? errorMessage) didSend) async {
    if (email.toLowerCase() == "") {
      //Reviewer
      loginWithReviewer();
    } else {
      FirebaseAuthStroe.signInWithFireBaseEmailLink(email, didSend);
    }
  }

  static signinWithEmailLink(UserCredential userCredential) async {
    // var loginUser = conventCredentialToAppUser(userCredential);

    // var appUserResult = await ApiService.loginUser(loginUser);

    // var appUser = appUserResult.model;

    // if (appUser != null) {
    //   getIt<AppEnvironmentModel>().currentUser = appUser;
    // }
    //login
  }

  static Future<AppUser> loginWithReviewer() async {
    AppUser user = AppUser(providerData: []);

    user.authSource = "email";
    user.loginStatus = "loggedIn";
    user.uid = "d6ecf7ef-61d7-4418-b7cb-3466e9d61726";
    user.displayName = "Reviewer";
    user.email = ""; //Reviewer Email
    getIt<AppEnvironmentModel>().currentUser = user;
    // await ApiService.loginUser(user);
    //login
    return user;
  }

  ///自動登入，將存在SharedPreferences的AppUser傳給ApiService
  // static Future<Result<AppUser>> autoLogin({required AppUser appUser}) async {
  //   var appUserResult = await ApiService.loginUser(appUser);

  //   return Result<AppUser>(
  //       model: appUserResult.model, errorMessage: appUserResult.errorMessage);
  // }

  ///Google登入： 透過Google登入取得UserCredential，轉成AppUser傳給ApiService
  // static Future<Result<AppUser>> signinWithGoogle() async {
  //   var result = await getIt<FirebaseAuthStroe>().signInWithGoogle();
  //   if (result.errorMessage != null) {
  //     return Result<AppUser>(model: null, errorMessage: result.errorMessage);
  //   } else {
  //     var loginUser = conventCredentialToAppUser(result.model);

  //     var appUserResult = await ApiService.loginUser(loginUser);

  //     return Result<AppUser>(
  //         model: appUserResult.model, errorMessage: appUserResult.errorMessage);
  //   }
  // }

  ///Apple登入：透過Apple登入取得UserCredential，轉成AppUser傳給ApiService
  // static Future<Result<AppUser>> signinWithApple() async {
  //   var result = await getIt<FirebaseAuthStroe>().signInWithApple();
  //   if (result.errorMessage != null) {
  //     return Result<AppUser>(model: null, errorMessage: result.errorMessage);
  //   } else {
  //     var loginUser = conventCredentialToAppUser(result.model);

  //     var appUserResult = await ApiService.loginUser(loginUser);

  //     return Result<AppUser>(
  //         model: appUserResult.model, errorMessage: appUserResult.errorMessage);
  //   }
  // }

  ///一般登入: 透過Firebase登入取得UserCredential，轉成AppUser傳給ApiService
  // static Future<Result<AppUser>> signinWithEmailAndPassword(
  //     String email, String password) async {
  //   var result = await getIt<FirebaseAuthStroe>()
  //       .signInWithEmailAndPassword(email, password);
  //   if (result.errorMessage != null) {
  //     return Result<AppUser>(model: null, errorMessage: result.errorMessage);
  //   } else {
  //     var loginUser = conventCredentialToAppUser(result.model);

  //     var appUserResult = await ApiService.loginUser(loginUser);

  //     return Result<AppUser>(
  //         model: appUserResult.model, errorMessage: appUserResult.errorMessage);
  //   }
  // }

  ///將Firebase登入取得的使用者資料轉成Server要的格式
  static AppUser conventCredentialToAppUser(UserCredential? credential) {
    User? userFromFirebase = credential?.user;
    List<ProviderData> providerDataList = [];

    for (UserInfo userInfo in userFromFirebase?.providerData ?? []) {
      var providerData = ProviderData(
        providerId: getDomainName(userInfo.providerId),
        uid: userInfo.uid ?? "",
        displayName: userInfo.displayName ?? "",
        photoUrl: userInfo.photoURL ?? "",
        email: userInfo.email ?? "",
        createDate: DateTime.now(),
        updateDate: DateTime.now(),
      );
      providerDataList.add(providerData);
    }

    AppUser appUser = AppUser(
        uid: userFromFirebase?.uid ?? "",
        email: userFromFirebase?.email ?? "",
        displayName: userFromFirebase?.displayName ?? "",
        photoUrl: userFromFirebase?.photoURL ?? "",
        createDate: userFromFirebase?.metadata.creationTime ?? DateTime.now(),
        updateDate: userFromFirebase?.metadata.creationTime ?? DateTime.now(),
        id: const Uuid().v4(),
        loginStatus: "loggedIn",
        authSource: "google",
        providerData: providerDataList);

    return appUser;
  }

  ///傳送訂閱資料到server
  // static Future<DefaultMessageModel?> sendSubscriptionsToServer(
  //     UserSubscription subscription) async {
  //   var result = await ApiService.sendSucscription(subscription);
  //   if (result.errorMessage != null) {
  //     return null;
  //   } else {
  //     return result.model;
  //   }
  // }

  static AuthSource getAuthSourceFromProviderId(String providerId) {
    return enumFromString(AuthSource.values, getDomainName(providerId));
  }

  static String getDomainName(String url) {
    final uri = url;
    final parts = uri.split('.');
    if (parts.length >= 2) {
      return parts[parts.length - 2];
    }
    return uri == 'password' ? 'email' : uri;
  }
}
