import 'package:flutter/material.dart';
import 'package:fruit/api_service/api_service.dart';
import 'package:fruit/auth/auth_store.dart';
import 'package:fruit/config.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/routes.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:fruit/widget/command/full_row_button.dart';
import 'package:fruit/widget/login/third_login_button.dart';
import 'package:fruit/widget/login/logo_slogan.dart';
import 'package:fruit/widget/login/or_line.dart';
import 'package:fruit/widget/login/pass_button.dart';
import 'package:fruit/widget/snack/snackbar_helper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                children: [
                  const LogoSlogan(),
                  const SizedBox(height: 20),
                  FullRowButton(
                    buttonTitle: "登入",
                    type: FullRowButtonType.whiteBgOrangeTitle,
                    buttonAction: () {
                      //todo: - 先直接登入，之後要改成跳轉到登入頁面
                      normalLogin();
                    },
                  ),
                  const SizedBox(height: 20),
                  FullRowButton(
                    buttonTitle: "註冊",
                    buttonAction: () {
                      normalRegis();
                    },
                    type: FullRowButtonType.orangeBgWhiteTitle,
                  ),
                  const SizedBox(height: 20),
                  const OrLine(),
                  const SizedBox(height: 20),
                  ThirdLoginButton(
                      loginType: LoginType.phone, buttonAction: () {}),
                  const SizedBox(height: 20),
                  ThirdLoginButton(
                      loginType: LoginType.apple, buttonAction: () {}),
                  const SizedBox(height: 20),
                  ThirdLoginButton(
                      loginType: LoginType.facebook, buttonAction: () {}),
                ],
              ).flexible(),
              PassButton(
                buttonAction: () {
                  navigatorKey.currentState?.pushNamedAndRemoveUntil(
                      mainHomePageRoute, (route) => false);
                },
              ).padding(const EdgeInsets.only(bottom: 20)),
            ],
          )),
    );
  }

  void normalLogin() async {
    var loading = showLoading();
    Result<AppUser> result = await AuthStore.normalSignin(
        appUser: AppUser(email: "ehun9999@gmail.com", password: "A58970953a"));
    loading();
    if (result.errorMessage != null) {
      showAppSnackBar(result.errorMessage ?? "");
      return null;
    } else if (result.model != null) {
      getIt<AppEnvironmentModel>().currentUser = result.model;
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(mainHomePageRoute, (route) => false);
    }
  }

  void normalRegis() async {
    var loading = showLoading();
    Result<AppUser> result = await AuthStore.regis(
        email: "ehun9999@gmail.com", password: "A58970953a", name: "GGG");
    loading();
    if (result.errorMessage != null) {
      showAppSnackBar(result.errorMessage ?? "");
    } else if (result.model != null) {
      getIt<AppEnvironmentModel>().currentUser = result.model;
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(mainHomePageRoute, (route) => false);
    }
  }
}
