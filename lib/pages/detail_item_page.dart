import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/routes.dart';
import 'package:fruit/widget/detail/detail_check_row.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class DetailItemPage extends StatelessWidget {
  const DetailItemPage({super.key, this.itemModel});

  final ItemModel? itemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: LayoutColor.whiteFFFFFF,
          ),
          title: SimpleText(
            text: "商品詳情",
            fontSize: 17,
            textColor: LayoutColor.black212121,
            fontWeight: FontWeight.w600,
          ),
          actions: [
            const SimpleText(
              text: "購物車",
            ).padding(const EdgeInsets.only(right: 20)).inkWell(
              onTap: () {
                navigatorKey.currentState?.pushNamed(cartItemPageRoute);
              },
            )
          ],
        ),
        body: Column(children: [
          ListView().flexible(),
          DetailCheckRow(
            itemModel: itemModel ?? ItemModel(),
          )
        ]));
  }
}
