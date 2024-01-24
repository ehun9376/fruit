import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CartTitleRow extends StatelessWidget {
  const CartTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleText(
      text: "購買清單",
      fontSize: 16,
    )
        .flexible()
        .widgetWithRow()
        .padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 10));
  }
}
