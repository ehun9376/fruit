import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

var appAdUnitId = "";

var bannerID = "";

var interstitialID = "";

// const firebaseDynamicLinkDomain = "https://caretale.page.link";

// const storeReviewerEmail = "reviewer2023^05!@caretale.link";

String formatNumber(double number) {
  NumberFormat formatter =
      NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 0);

  return formatter.format(number);
}
