import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/widget/cart/cart_count_row.dart';
import 'package:fruit/widget/simpleWidget/simple_checkbox.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CartItemRow extends StatelessWidget {
  const CartItemRow({super.key, required this.itemModel, this.onCheckChange});

  final ItemModel itemModel;
  final Function(bool)? onCheckChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SimpleCheckBox(
            selected: itemModel.isSelected,
            onChange: (selected) {
              onCheckChange?.call(selected);
            }).padding(const EdgeInsets.only(right: 10)),
        const SimpleImage(
          imageURL: "https://picsum.photos/80/80",
          size: Size(85, 85),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SimpleText(
              text: itemModel.itemName ?? "",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: LayoutColor.black212121,
              align: TextAlign.left,
            ),
            SimpleText(
              text: "\$${itemModel.price}/盒",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              align: TextAlign.left,
            ),
            CartCountRow(
              itemModel: itemModel,
              onCountChange: (count) {
                itemModel.quantity = count;
                debugPrint("count: $count");
              },
            )
          ],
        ).sizedBox(height: 85).padding(const EdgeInsets.only(left: 10))
      ],
    ).padding(const EdgeInsets.symmetric(vertical: 10));
  }
}
