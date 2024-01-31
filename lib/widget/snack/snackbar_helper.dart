import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/layout/layout_guides.dart';
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

///會先顯示loading，等待future執行完畢後，關閉loading，並回傳future的結果
Function showLoading({
  String? message,
}) {
  final dialog = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(color: Colors.black),
        if (message == null) const SizedBox(height: 10.0),
        if (message == null) Text(message ?? ""),
      ],
    ),
  );

  showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) => dialog,
  );

  return () {
    Navigator.of(navigatorKey.currentContext!).pop();
  };
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
              buttontitle: '取消',
              titleColor: LayoutColor.black000000,
              buttonAction: () {
                navigatorKey.currentState?.pop();
              },
            ),
            SimpleButton(
              buttontitle: rightButton ?? '確定',
              titleColor: LayoutColor.black000000,
              buttonAction: () {
                navigatorKey.currentState?.pop();
                if (rightButtonOnTap != null) {
                  rightButtonOnTap();
                }
              },
            ),
          ],
        );
      });
}
