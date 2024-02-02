import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fruit/api_service/model/result.dart';
import 'package:fruit/auth/auth_store.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/service/email_store/email_store.dart';
import 'package:fruit/service/firebase_auth/firebase_auth_store_config.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthStroe {
  //信箱驗證登入
  static signInWithFireBaseEmailLink(
      String email, Function(String? errorMessage) didSend) {
    getIt<EmailSecureStore>().setEmail(email);

    var emailAuth = email;
    FirebaseAuth.instance
        .sendSignInLinkToEmail(
            email: emailAuth, actionCodeSettings: FirebaseAuthStoreConfig.acs)
        .catchError((onError) {
      debugPrint('Error sending email onError $onError ');
      didSend(
          "Please try another verification method \n ErrorMessage: $onError");
    }).onError((error, stackTrace) {
      debugPrint('Error sending email onError $error');
      didSend("Please try another verification method\n ErrorMessage: $error");
    }).then((value) {
      didSend(null);
    });
  }

  //Google登入
  Future<Result<UserCredential?>> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var logedCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Once signed in, return the UserCredential
      return Result(model: logedCredential, errorMessage: null);
    } catch (e) {
      debugPrint("signInWithGoogle Error: $e");
      return Result(model: null, errorMessage: "$e");
    }
  }

  //信箱密碼登入
  Future<Result<UserCredential?>> signInWithEmailAndPassword(
      String emailAddress, String password) async {
    // Trigger the authentication flow
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // Once signed in, return the UserCredential
      return Result(model: credential, errorMessage: null);
    } catch (e) {
      debugPrint("signInWithEmailAndPassword Error: $e");
      return Result(model: null, errorMessage: "$e");
    }
  }

  ///Apple登入
  Future<Result<UserCredential?>> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    try {
      if (kIsWeb) {
        var user = await FirebaseAuth.instance.signInWithPopup(appleProvider);
        return Result(model: user, errorMessage: null);
      } else {
        var user =
            await FirebaseAuth.instance.signInWithProvider(appleProvider);
        return Result(model: user, errorMessage: null);
      }
    } catch (e) {
      return Result(model: null, errorMessage: "$e");
    }
  }

  //向FirebaseEmailPassword註冊
  Future<Result<UserCredential?>> regisWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Result(model: credential, errorMessage: null);
    } on FirebaseAuthException catch (e) {
      debugPrint("RegisWithEmailAndPassword FirebaseAuthException: ${e.code}");

      return Result(model: null, errorMessage: e.code);
    } catch (e) {
      debugPrint("RegisWithEmailAndPassword error: $e");
      return Result(model: null, errorMessage: "$e");
    }
  }

  checkEmailLink(String emailLink) async {
    String? email = await getIt<EmailSecureStore>().getEmail();

    if (FirebaseAuth.instance.isSignInWithEmailLink(emailLink)) {
      try {
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailLink(email: email ?? "", emailLink: emailLink);

        AuthStore.signinWithEmailLink(userCredential);

        debugPrint('Successfully signed in with email link!');
      } catch (error) {
        debugPrint('Error signing in with email link.');
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
