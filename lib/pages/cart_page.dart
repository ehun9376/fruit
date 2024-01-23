import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/cart/cart_check_row.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: LayoutColor.whiteFFFFFF,
          ),
          title: SimpleText(
            text: "購物車",
            fontSize: 17,
            textColor: LayoutColor.black212121,
            fontWeight: FontWeight.w600,
          ),
          leading: Container(),
        ),
        body: Column(
          children: [
            ListView().flexible(),
            CartCheckRow(
              totaPrice: 100,
            )
          ],
        ));
  }
}
