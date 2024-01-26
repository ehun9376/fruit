import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class TitleSubTitleMoreRow extends StatelessWidget {
  const TitleSubTitleMoreRow(
      {super.key,
      this.onMoreTap,
      required this.title,
      this.subTitle,
      this.showMoreIcon = false,
      this.titleFontSize = 16});

  final String title;

  final double? titleFontSize;

  final String? subTitle;

  final bool showMoreIcon;

  final Function()? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SimpleText(
          text: title,
          fontSize: titleFontSize,
        ).flexible(),
        [
          SimpleText(
            text: subTitle,
            fontSize: 14,
          ),
          if (showMoreIcon)
            SimpleImage(
              icon: Icons.keyboard_arrow_right,
              iconSize: 32,
              color: LayoutColor.grey969696,
            )
        ].row(),
      ],
    ).padding(const EdgeInsets.symmetric(horizontal: 20)).inkWell(onTap: () {
      onMoreTap?.call();
    });
  }
}
