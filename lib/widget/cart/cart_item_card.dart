import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/widget/cart/cart_item_row.dart';
import 'package:fruit/widget/simpleWidget/simple_checkbox.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key, required this.itemModels});

  final List<ItemModel> itemModels;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SimpleCheckBox(
              selected: widget.itemModels
                  .map((e) => e.isSelected)
                  .reduce((a, b) => a && b),
              onChange: (selected) {
                setState(() {
                  for (var element in widget.itemModels) {
                    element.isSelected = selected;
                  }
                });
              },
            ).padding(const EdgeInsets.only(right: 10)),
            SimpleText(
              text: widget.itemModels.first.storeName ?? "",
            ).flexible()
          ],
        ).padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        Container(
          color: LayoutColor.greyD4D4D4,
          height: 2,
        ),
        Column(
          children: widget.itemModels
              .map(
                (e) => CartItemRow(
                  itemModel: e,
                  onCheckChange: (selected) {
                    setState(() {
                      e.isSelected = selected;
                    });
                  },
                ),
              )
              .toList(),
        ).padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      ],
    );
  }
}
