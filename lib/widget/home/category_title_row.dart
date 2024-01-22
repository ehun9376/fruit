import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CategoryTitleRow extends StatelessWidget {
  const CategoryTitleRow(
      {super.key, required this.title, required this.onMoreTap});

  final String title;
  final Function onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              color: LayoutColor.orangeF57C00,
              height: 15,
              width: 5,
            ),
            const SizedBox(
              width: 5,
            ),
            SimpleText(
              text: title,
              textColor: LayoutColor.black212121,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
        Row(
          children: [
            SimpleText(
              text: "查看更多",
              textColor: LayoutColor.grey969696,
            ),
            SimpleImage(
              icon: Icons.arrow_forward_ios,
              iconSize: 17,
              color: LayoutColor.grey969696,
            )
          ],
        ),
      ],
    );
  }
}
