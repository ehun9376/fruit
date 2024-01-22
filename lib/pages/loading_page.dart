import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/routes.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //TODO: - autoLogin
    Future.delayed(const Duration(seconds: 1), () {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(loginPageRoute, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: SimpleImage(
          imageName: "logo.png",
          size: Size(150, 150),
        ),
      ),
    );
  }
}
