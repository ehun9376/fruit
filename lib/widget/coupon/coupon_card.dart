import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/model/coupon/coupon_model.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 1)),
      child: Column(
        children: [
          SimpleText(
            text: couponModel.type,
            align: TextAlign.left,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ).flexible().widgetWithRow().flexible(),
          SimpleText(
            text: couponModel.value,
            align: TextAlign.left,
            fontSize: 14,
          ).flexible().widgetWithRow().flexible(),
        ],
      ),
    );
  }
}
