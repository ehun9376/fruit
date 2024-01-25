import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/shared_model/cart_items_model.dart';
import 'package:fruit/widget/simpleWidget/simple_button.dart';
import 'package:fruit/widget/snack/snackbar_helper.dart';
import 'package:fruit/widget/track_button/track_button.dart';

class DetailCheckRow extends StatelessWidget {
  const DetailCheckRow({super.key, required this.itemModel});

  final ItemModel itemModel;
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
            TrackButton(trackItem: itemModel).padding(),
            Container().flexible(),
            SimpleButton(
              buttontitle: "直接購買",
              titleColor: Colors.white,
              backgroundColor: Colors.orange,
              buttonMiniSize: const Size(120, 40),
              fontSize: 16,
              cornerRadius: 25,
              buttonAction: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            SimpleButton(
              buttontitle: "加入購物車",
              titleColor: Colors.white,
              backgroundColor: Colors.orange,
              buttonMiniSize: const Size(120, 40),
              fontSize: 16,
              cornerRadius: 25,
              buttonAction: () {
                getIt<CartItemsModel>().addCartItem(itemModel);
              },
            ),
          ],
        ).padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      ],
    ).safeArea();
  }
}
