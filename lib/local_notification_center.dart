import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationCenter extends ChangeNotifier {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static SharedPreferences? sharedPreferences;

  init() async {
    // 初始化通知插件
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // 点击通知回调
      },
    );
    sharedPreferences ??= await SharedPreferences.getInstance();
    tz.initializeTimeZones();
  }

  setALert(int id, String title, String content, TimeOfDay time) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.UTC);

    DateTime dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute).toUtc();

    final tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.UTC,
      now.year,
      now.month,
      now.day,
      dateTime.hour,
      dateTime.minute,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        content,
        scheduledDate,
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  setTest() async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.UTC);
    final tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.UTC,
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
      now.second + 5,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "test",
        "tttt",
        scheduledDate,
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
