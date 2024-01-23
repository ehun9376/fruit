import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/font/fonts.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_button.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CartCheckRow extends StatelessWidget {
  const CartCheckRow({super.key, required this.totaPrice});

  final int totaPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey.withAlpha(80),
        ),
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SimpleText(
                  text: "總共",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                SimpleText(
                  text: "$totaPrice",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                )
              ],
            ).flexible(),
            SimpleButton(
              buttontitle: "立即結帳",
              titleColor: LayoutColor.whiteFFFFFF,
              backgroundColor: LayoutColor.orangeF57C00,
              buttonMiniSize: const Size(120, 40),
              fontSize: 16,
              cornerRadius: 25,
              buttonAction: () {},
            )
          ],
        ).padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        Container(
          height: 1,
          color: Colors.grey.withAlpha(80),
        )
      ],
    );
  }
}
