import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class LogoSlogan extends StatelessWidget {
  const LogoSlogan({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: SimpleImage(
            imageName: "logo.png",
            size: Size(150, 150),
          ),
        ),
        SimpleText(
          text: "Slogan", //TODO: - add slogan
          fontSize: 16,
          textColor: LayoutColor.greyBFBFBF,
        )
      ],
    );
  }
}
