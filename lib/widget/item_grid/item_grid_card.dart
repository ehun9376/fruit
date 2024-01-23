import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class ItemGridCard extends StatelessWidget {
  const ItemGridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double parentWidth = constraints.maxWidth;

        return Column(
          children: [
            SimpleImage(
              imageURL: "https://picsum.photos/200/300",
              size: Size(parentWidth, parentWidth),
              cornerRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            SimpleText(
              text: "紐西蘭櫻桃26mm-28mm 2kg x1盒(2kg±10%)",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: LayoutColor.black212121,
              align: TextAlign.left,
            )
                .flexible()
                .widgetWithRow()
                .padding(const EdgeInsets.all(5))
                .flexible(),
            SimpleText(
              text: "\$${100}/盒",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              textColor: LayoutColor.redED4427,
              align: TextAlign.left,
            )
                .flexible()
                .widgetWithRow()
                .padding(const EdgeInsets.all(5))
                .flexible(),
          ],
        );
      }),
    );
  }
}
