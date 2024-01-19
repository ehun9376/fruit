import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit/widget/snack/snackbar_helper.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchTo(String link) async {
  var url = Uri.parse(LinkableElement("", link, "").url);
  if (await canLaunchUrl(url)) {
    try {
      await launchUrl(url);
      return;
    } catch (e) {
      debugPrint("launchUrl Error $e");
      showAppSnackBar("無法開啟$link，已複製至剪貼簿");
      Clipboard.setData(ClipboardData(text: link));
    }
  } else {
    showAppSnackBar("無法開啟$link，已複製至剪貼簿");
    Clipboard.setData(ClipboardData(text: link));
  }
}
