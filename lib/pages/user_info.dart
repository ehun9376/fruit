import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SimpleText(
            text: "個人中心",
            fontSize: 17,
            textColor: LayoutColor.black212121,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: const Center(
          child: Text("TrackListPage"),
        ));
  }
}
