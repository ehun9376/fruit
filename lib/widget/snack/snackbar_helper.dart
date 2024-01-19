import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/widget/simpleWidget/simple_button.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

void showAppSnackBar(String message) {
  ScaffoldMessenger.of(
          Navigator.of(navigatorKey.currentContext!).overlay!.context)
      .showSnackBar(SnackBar(
    content: Center(
        child: SimpleText(
      text: message,
      fontSize: 16,
    )),
  ));
}

typedef CloseDialog = void Function();

/// 回傳一個讀取中的Dialog Function，會先顯示Dialog，並回傳一個關閉Dialog的Function。
Future showLoadingDialog({
  Future? future,
  String message = "讀取中",
}) async {
  final dialog = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(color: Colors.black),
        const SizedBox(height: 10.0),
        Text(message),
      ],
    ),
  );

  showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) => dialog,
  );

  await future?.then((value) {
    Navigator.of(navigatorKey.currentContext!).pop();
  });
}

showConfirmDialog(
    {String? title,
    String? current,
    String? rightButton,
    Function? rightButtonOnTap}) {
  showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: SimpleText(text: title),
          content: SimpleText(text: current),
          actions: [
            SimpleButton(
              buttontitle: 'Cancel',
              buttonAction: () {
                Navigator.of(navigatorKey.currentContext!).pop();
              },
            ),
            SimpleButton(
              buttontitle: rightButton ?? 'Confirm',
              buttonAction: () {
                if (rightButtonOnTap != null) {
                  rightButtonOnTap();
                }
              },
            ),
          ],
        );
      });
}
