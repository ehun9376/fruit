import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/shared_model/cart_items_model.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/snack/snackbar_helper.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key, required this.itemModel});

  final ItemModel itemModel;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  final CartItemsModel cartItemsModol = getIt<CartItemsModel>();

  @override
  Widget build(BuildContext context) {
    // bool isSelected = cartItemsModol.isCartItem(widget.itemModel);

    return SimpleImage(
      imageName: "ic_tab_shop_plus.png",
      size: const Size(22, 20),
      color: LayoutColor.grey969696,
    ).inkWell(onTap: () {
      setState(() {
        cartItemsModol.addCartItem(widget.itemModel);

        debugPrint(
            "cartButton: ${widget.itemModel.itemName} ${widget.itemModel.storeName}");
      });
      showAppSnackBar("已加入購物車");
    });
  }
}
