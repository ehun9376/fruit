import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/routes.dart';
import 'package:fruit/widget/command/full_row_button.dart';
import 'package:fruit/widget/login/third_login_button.dart';
import 'package:fruit/widget/login/logo_slogan.dart';
import 'package:fruit/widget/login/or_line.dart';
import 'package:fruit/widget/login/pass_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const LogoSlogan(),
          const SizedBox(height: 20),
          FullRowButton(
            buttonTitle: "登入",
            type: FullRowButtonType.whiteBgOrangeTitle,
            buttonAction: () {
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                  mainHomePageRoute, (Route<dynamic> route) => false);
            },
          ),
          const SizedBox(height: 20),
          FullRowButton(
            buttonTitle: "註冊",
            buttonAction: () {},
            type: FullRowButtonType.orangeBgWhiteTitle,
          ),
          const SizedBox(height: 20),
          const OrLine(),
          const SizedBox(height: 20),
          ThirdLoginButton(loginType: LoginType.phone, buttonAction: () {}),
          const SizedBox(height: 20),
          ThirdLoginButton(loginType: LoginType.apple, buttonAction: () {}),
          const SizedBox(height: 20),
          ThirdLoginButton(loginType: LoginType.facebook, buttonAction: () {}),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PassButton(),
            ],
          ).flexible()
        ],
      ).padding(const EdgeInsets.symmetric(horizontal: 40, vertical: 40)),
    );
  }
}
