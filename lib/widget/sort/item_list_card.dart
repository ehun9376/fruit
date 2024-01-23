import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class ItemListCard extends StatelessWidget {
  const ItemListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: LayoutColor.whiteFFFFFF,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: LayoutColor.black000000.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SimpleImage(
            imageURL: "https://picsum.photos/200/300",
            size: Size(132, 132),
            cornerRadius: BorderRadius.all(Radius.circular(5)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SimpleText(
                text:
                    "紐西蘭櫻桃26mm-28mm 2kg x1盒(2kg±10%)紐西蘭櫻桃26mm-28mm 2kg x1盒(2kg±10%)",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textColor: LayoutColor.black212121,
                align: TextAlign.left,
                lines: 2,
              ).flexible().widgetWithRow(),
              SimpleText(
                text: "\$${100}/盒",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                textColor: LayoutColor.redED4427,
                align: TextAlign.left,
              )
                  .flexible()
                  .widgetWithRow()
                  .padding(const EdgeInsets.only(top: 3)),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SimpleImage(
                    imageName: "ic_tab_shop_plus.png",
                    size: const Size(22, 20),
                    color: LayoutColor
                        .grey969696, //LayoutColor.redED4427 LayoutColor.grey969696
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SimpleImage(
                    imageName:
                        "ic_tab_list_full.png", //ic_tab_list_full ic_tab_list
                    size: const Size(20, 20),
                    color: LayoutColor
                        .redED4427, //LayoutColor.redED4427 LayoutColor.grey969696
                  ),
                ],
              )
            ],
          ).padding().flexible()
        ],
      ),
    );
  }
}
