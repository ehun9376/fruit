import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CouponPointRow extends StatelessWidget {
  const CouponPointRow({super.key, required this.point});
  final int point;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: LayoutColor.orangeF57C00,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SimpleText(
            text: "$point",
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
          const SimpleText(
            text: "點",
          ).padding(const EdgeInsets.only(bottom: 8, left: 2))
        ],
      )),
    );
  }
}
