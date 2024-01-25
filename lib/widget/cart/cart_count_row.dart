import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/shared_model/cart_items_model.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';
import 'package:provider/provider.dart';

class CartCountRow extends StatelessWidget {
  const CartCountRow(
      {super.key, required this.itemModel, required this.onCountChange});

  final ItemModel itemModel;
  final Function(int) onCountChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: LayoutColor.greyE7E7E7, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          SimpleImage(
            icon: Icons.remove,
            iconSize: 20,
            color: LayoutColor.grey969696,
          ).inkWell(onTap: () {
            getIt<CartItemsModel>().removeCartItem(itemModel);
          }),
          Selector<CartItemsModel, int?>(
            selector: (p0, p1) => p1.cartItems[itemModel.storeID ?? ""]
                ?.firstWhere((element) => element.itemID == itemModel.itemID)
                .quantity,
            builder: (context, value, child) {
              return SimpleText(
                text: "${value ?? 0}",
                fontSize: 15,
              ).padding(const EdgeInsets.symmetric(horizontal: 10));
            },
          ),
          SimpleImage(
            icon: Icons.add,
            iconSize: 20,
            color: LayoutColor.grey969696,
          ).inkWell(onTap: () {
            getIt<CartItemsModel>().addCartItem(itemModel);
          }),
        ],
      ),
    );
  }
}
