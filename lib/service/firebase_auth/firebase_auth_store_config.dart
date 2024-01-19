import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthStoreConfig {
  static final acs = ActionCodeSettings(
      url: 'https://caretale.web.app/login',
      handleCodeInApp: true,
      iOSBundleId: 'org.caretale.ios',
      androidPackageName: 'org.caretale.android',
      androidInstallApp: true,
      dynamicLinkDomain: "caretale.page.link",
      // minimum Version of our App to handle email link login
      androidMinimumVersion: '25');
}
