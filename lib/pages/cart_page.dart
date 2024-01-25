import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/shared_model/cart_items_model.dart';
import 'package:fruit/widget/cart/cart_check_row.dart';
import 'package:fruit/widget/cart/cart_item_card.dart';
import 'package:fruit/widget/command/title_subtitle_row.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';
import 'package:provider/provider.dart';

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
            const TitleSubTitleRow(
              title: "購買清單",
            ),
            Selector<CartItemsModel, Map<String, List<ItemModel>>>(
              selector: ((p0, p1) => p1.cartItems),
              builder: (context, value, child) {
                return ListView.separated(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    var entries = value.entries.elementAt(index);
                    return CartItemCard(
                      itemModels: entries.value,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 10,
                      color: LayoutColor.greyECECEC,
                    );
                  },
                );
              },
            ).flexible(),
            const CartCheckRow(
              totaPrice: 100,
            )
          ],
        ));
  }
}
