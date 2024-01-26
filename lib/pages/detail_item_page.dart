import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/routes.dart';
import 'package:fruit/widget/command/ec10_divider.dart';
import 'package:fruit/widget/command/title_subtitle_row.dart';
import 'package:fruit/widget/detail/detail_check_row.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class DetailItemPage extends StatelessWidget {
  const DetailItemPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ItemModel arguments =
        ModalRoute.of(context)?.settings.arguments as ItemModel;

    final ItemModel itemModel = arguments;

    List<Widget> widgetList = [];

    widgetList.add(Column(
      children: [
        AspectRatio(
          aspectRatio: 3 / 2,
          child: SimpleImage(
            borderColor: LayoutColor.gray515151,
            borderWidth: 0.5,
            imageURL: itemModel.imageURL ?? "",
            size: const Size(double.infinity, 206),
            cornerRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ).padding(),
        TitleSubTitleMoreRow(title: itemModel.itemName ?? ""),
        TitleSubTitleMoreRow(title: "${itemModel.price}/ 箱")
      ],
    ));

    widgetList.add(Column(
      children: [
        const TitleSubTitleMoreRow(title: "配送資訊"),
        const SimpleText(
          text: "配送資料",
        ).padding(const EdgeInsets.all(40)).flexible().widgetWithRow()
      ],
    ));

    widgetList.add(Column(
      children: [
        const TitleSubTitleMoreRow(title: "優惠資訊"),
        const SimpleText(
          text: "優惠資料",
        ).padding(const EdgeInsets.all(40)).flexible().widgetWithRow()
      ],
    ));

    widgetList.add(Column(
      children: [
        const TitleSubTitleMoreRow(title: "付款方式"),
        const SimpleText(
          text: "付款資料",
        ).padding(const EdgeInsets.all(40)).flexible().widgetWithRow()
      ],
    ));

    widgetList.add(Column(
      children: [
        const TitleSubTitleMoreRow(title: "商品詳情"),
        const SimpleText(
          text: "商品資料",
        ).padding(const EdgeInsets.all(40)).flexible().widgetWithRow()
      ],
    ));

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
          ListView.separated(
            itemCount: widgetList.length,
            itemBuilder: (context, index) => widgetList[index],
            separatorBuilder: (context, index) => const EC10Divider()
                .padding(const EdgeInsets.symmetric(vertical: 10)),
          ).flexible(),
          DetailCheckRow(
            itemModel: itemModel,
          )
        ]));
  }
}
