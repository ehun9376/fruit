import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_button.dart';

enum FullRowButtonType {
  orangeBgWhiteTitle,
  whiteBgOrangeTitle,
  whiteBgRedTitle,
}

class FullRowButton extends StatelessWidget {
  const FullRowButton(
      {super.key,
      required this.buttonTitle,
      required this.buttonAction,
      required this.type});

  final String buttonTitle;

  final Function() buttonAction;

  final FullRowButtonType type;

  @override
  Widget build(BuildContext context) {
    Color? backgroudColor;
    Color? titleColor;
    Color? borderColor;
    double? radius;
    double? fontSize;

    switch (type) {
      case FullRowButtonType.orangeBgWhiteTitle:
        backgroudColor = LayoutColor.orangeF57C00;
        titleColor = LayoutColor.whiteFFFFFF;
        borderColor = LayoutColor.orangeF57C00;
        radius = 25;
        fontSize = 16;
      case FullRowButtonType.whiteBgOrangeTitle:
        backgroudColor = LayoutColor.whiteFFFFFF;
        titleColor = LayoutColor.orangeF57C00;
        borderColor = LayoutColor.orangeF57C00;
        radius = 25;
        fontSize = 16;
      case FullRowButtonType.whiteBgRedTitle:
        backgroudColor = LayoutColor.whiteFFFFFF;
        titleColor = LayoutColor.redFF5722;
        borderColor = LayoutColor.greyA5A5A5.withOpacity(0.3);
        radius = 15;
        fontSize = 14;
    }

    return SimpleButton(
      buttontitle: buttonTitle,
      backgroundColor: backgroudColor,
      titleColor: titleColor,
      borderColor: borderColor,
      borderWidth: 1,
      cornerRadius: radius,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      buttonMiniSize: const Size(35, 50),
      buttonAction: () {
        buttonAction();
      },
    )
        .flexible()
        .widgetWithRow()
        .padding(const EdgeInsets.symmetric(horizontal: 15));
  }
}
