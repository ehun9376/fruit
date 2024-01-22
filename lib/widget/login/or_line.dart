import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: LayoutColor.greyE6E6E6,
          height: 1.5,
        ).flexible(),
        SimpleText(
          text: "或",
          fontSize: 14,
          textColor: LayoutColor.gray515151,
        ).padding(const EdgeInsets.symmetric(horizontal: 15)),
        Container(
          color: LayoutColor.greyE6E6E6,
          height: 1.5,
        ).flexible()
      ],
    ).padding(const EdgeInsets.symmetric(horizontal: 15));
  }
}
