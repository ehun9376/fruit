import 'package:flutter/material.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SimpleText(
          text: "個人中心",
        ),
      ),
      body: Container(),
    );
  }
}
