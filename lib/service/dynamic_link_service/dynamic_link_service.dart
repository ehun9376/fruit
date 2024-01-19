import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/service/firebase_auth/firebase_auth_store.dart';

class DynamicLinkService {
  final FirebaseDynamicLinks firebaseDynamicLinks =
      FirebaseDynamicLinks.instance;
  final FirebaseAuthStroe firebaseAuthStroe = getIt<FirebaseAuthStroe>();

  Future<void> init() async {
    try {
      debugPrint("######DDDD===>> Setting up Firebase Dynamic Link Listening.");

      firebaseDynamicLinks.onLink.listen((linkData) async {
        debugPrint(
            "######DDDD===>> Received Dynamic Link when App is open: ${linkData.link}");
        // checkLink(linkData.link);
      });

      final linkData = await firebaseDynamicLinks.getInitialLink();
      final link = linkData?.link;

      if (link != null) {
        debugPrint("######DDDD===>> Received Dynamic Link at App Start: $link");
        // checkLink(link);
      }
    } catch (e) {
      // Handle any other exceptions
      debugPrint("######DDDD===>> Unknown error in init(): ${e.toString()}");
    }
  }

  Future trySignWithEmail() async {
    debugPrint('deepLink: trySignWithEmail');
    final PendingDynamicLinkData? initialLink =
        await firebaseDynamicLinks.getInitialLink();

    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      firebaseAuthStroe.checkEmailLink(deepLink.toString());
      debugPrint('deepLink: $deepLink');
    } else {
      debugPrint('deepLink: NUll');

      return null;
    }
  }

  Future<String> createDynamicLink(String id) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      // This should match firebase but without the username query param
      uriPrefix: "",

      link: Uri.parse('""'),
      androidParameters: const AndroidParameters(
        packageName: '',
        minimumVersion: 55,
      ),
      iosParameters: const IOSParameters(
        bundleId: '',
        minimumVersion: '1.0.0',
        appStoreId: '',
      ),
      googleAnalyticsParameters: const GoogleAnalyticsParameters(
        source: "line",
        medium: "social",
        campaign: "deep-link",
      ),
      socialMetaTagParameters: const SocialMetaTagParameters(
        title: "",
        description: "",
      ),
    );

    final link = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    debugPrint("----------->>> Short Link Made for ${parameters.link}");
    debugPrint("----------->>> Short Link  ${link.shortUrl.toString()}");
    return link.shortUrl.toString();
  }
}
