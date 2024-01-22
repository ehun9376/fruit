import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_button.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

enum LoginType { phone, apple, google, facebook, line }

extension LoginTypeValue on LoginType {
  String get buttonTitle {
    switch (this) {
      case LoginType.phone:
        return "手機登入";
      case LoginType.apple:
        return "使用 Apple ID 登入";
      case LoginType.google:
        return "使用 Google 登入";
      case LoginType.facebook:
        return "使用 facebook 登入";
      case LoginType.line:
        return "使用 line 登入";
      default:
        return "";
    }
  }

  String get logoName {
    switch (this) {
      case LoginType.phone:
        return "ic_media_phone.png";
      case LoginType.apple:
        return "ic_media_apple.png";
      case LoginType.google:
        return "ic_media_google.png";
      case LoginType.facebook:
        return "ic_media_facebook.png";
      case LoginType.line:
        return "ic_media_line.png";
      default:
        return "";
    }
  }
}

class ThirdLoginButton extends StatelessWidget {
  const ThirdLoginButton(
      {super.key, required this.loginType, required this.buttonAction});
  final LoginType loginType;
  final Function buttonAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: LayoutColor.greyE7E7E7, width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: [
        SimpleImage(
          imageName: loginType.logoName,
          size: const Size(25, 25),
        ).padding(const EdgeInsets.only(left: 15)),
        SimpleButton(
          titleColor: LayoutColor.grey515151,
          buttontitle: loginType.buttonTitle,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          buttonAction: () {
            buttonAction();
          },
          // align: TextAlign.center,
        ).flexible(),
        const SizedBox(
          width: 35,
        )
      ].row(MainAxisAlignment.center),
    )
        .flexible()
        .widgetWithRow()
        .padding(const EdgeInsets.symmetric(horizontal: 15));
    ;
  }
}
