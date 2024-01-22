import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_button.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

enum TagType { dateGift, companyGift, drink }

extension TagTypeValue on TagType {
  String get title {
    switch (this) {
      case TagType.dateGift:
        return "年節禮盒";
      case TagType.companyGift:
        return "公司送禮";
      case TagType.drink:
        return "飲料另配";
    }
  }

  String get imageName {
    switch (this) {
      case TagType.dateGift:
        return "date_gift.png";
      case TagType.companyGift:
        return "company_gift.png";
      case TagType.drink:
        return "drink.png";
    }
  }
}

class TagButton extends StatelessWidget {
  const TagButton(
      {super.key, required this.buttonAction, required this.tagType});
  final TagType tagType;
  final Function buttonAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleButton(
          imageName: tagType.imageName,
          imageSize: const Size(25, 25),
          cornerRadius: 40,
          selectedTintColor: LayoutColor.orangeFB8C00,
          backgroundColor: LayoutColor.orangeFFF3E0,
        ).sizedBox(width: 60, height: 60),
        SimpleText(
          text: tagType.title,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          textColor: LayoutColor.grey515151,
        ).padding(const EdgeInsets.only(top: 10))
      ],
    ).inkWell(onTap: () {
      buttonAction();
    });
  }
}
