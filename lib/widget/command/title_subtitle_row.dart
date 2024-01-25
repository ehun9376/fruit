import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class TitleSubTitleRow extends StatelessWidget {
  const TitleSubTitleRow(
      {super.key, this.onMoreTap, required this.title, this.subTitle});

  final String title;

  final String? subTitle;

  final Function()? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SimpleText(
          text: title,
          fontSize: 16,
        ).flexible(),
        SimpleText(
          text: subTitle,
          fontSize: 14,
        ),
      ],
    ).padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)).inkWell(
        onTap: () {
      onMoreTap?.call();
    });
  }
}
