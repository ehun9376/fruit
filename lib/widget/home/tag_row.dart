import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/widget/home/ball_tag_button.dart';

class TagRow extends StatelessWidget {
  const TagRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TagButton(tagType: TagType.dateGift, buttonAction: () {}),
        TagButton(tagType: TagType.companyGift, buttonAction: () {}),
        TagButton(tagType: TagType.drink, buttonAction: () {}),
      ],
    )
        .singleChildScrollView()
        .padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 20));
  }
}
