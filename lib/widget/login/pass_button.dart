import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_button.dart';

class PassButton extends StatelessWidget {
  const PassButton({super.key, this.buttonAction});

  final Function? buttonAction;

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      buttontitle: "略過，直接前往賣場",
      titleColor: LayoutColor.orangeF57C00,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      buttonAction: () {
        buttonAction?.call();
      },
    );
  }
}
