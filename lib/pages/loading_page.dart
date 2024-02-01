import 'package:flutter/material.dart';
import 'package:fruit/api_service/api_service.dart';
import 'package:fruit/auth/auth_store.dart';
import 'package:fruit/config.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/routes.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/snack/snackbar_helper.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: const Center(
          child: SimpleImage(
            imageName: "logo.png",
            size: Size(150, 150),
          ),
        ),
      ),
    );
  }

  void autoLogin() async {
    Result<AppUser>? result = await AuthStore.autoLogin();
    if (result == null) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(loginPageRoute, (route) => false);
    } else if (result.errorMessage != null) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(loginPageRoute, (route) => false);
      showAppSnackBar(result.errorMessage ?? "");
    } else if (result.model != null) {
      getIt<AppUserEnvironmentModel>().currentUser = result.model;
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(mainHomePageRoute, (route) => false);
    }
  }
}
