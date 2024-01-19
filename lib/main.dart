import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit/app.dart';
import 'package:fruit/lauguage/lauguage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // await FirebaseServiece.init();

  // await GetItService.initialize();
  // await getIt<DynamicLinkService>().init();
  // await getIt<LocalNotificationCenter>().init();

  // await AppTrackingTransparency.requestTrackingAuthorization();

  runApp(EasyLocalization(
    supportedLocales: Language.values.map((e) => e.locale).toList(),
    path: "assets/translations",
    fallbackLocale: Language.en.locale,
    child: const MainApp(),
  ));
}
