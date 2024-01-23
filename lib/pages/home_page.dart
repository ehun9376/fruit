import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/home/ad_swiper.dart';
import 'package:fruit/widget/home/category_title_row.dart';
import 'package:fruit/widget/home/search_bar.dart';
import 'package:fruit/widget/home/tag_row.dart';
import 'package:fruit/widget/item_grid/item_grid.dart';
import 'package:fruit/widget/simpleWidget/simple_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: LayoutColor.orangeF57C00,
          ),
        ),
        body: Column(
          children: [
            SearchBarRow(
              onSearchBarSubmitted: (searchText) {},
              onHistoryClick: () {},
              onNoticeClick: () {},
              showButtons: true,
            ),
            ListView(
              children: [
                [
                  AdSwiper().padding(
                    const EdgeInsets.only(top: 15),
                  ),
                  const TagRow(),
                ].column().container(color: LayoutColor.whiteFFFFFFF),
                [
                  CategoryTitleRow(
                    title: '當季限定',
                    onMoreTap: () {},
                  ).padding(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                  ItemGrid().padding(const EdgeInsets.symmetric(horizontal: 20))
                ].column().container(color: LayoutColor.greyF6F6F6)
              ],
            ).flexible(),
          ],
        ).safeArea(),
        floatingActionButton: SimpleButton(
          buttontitle: "快速下單",
          imageName: "ic_but_im.png",
          imageSize: const Size(17, 17),
          segmented: Segmented.leftToRight,
          iconColor: LayoutColor.orangeFB8C00,
          titleColor: LayoutColor.orangeFB8C00,
          backgroundColor: Colors.white,
          borderWidth: 0.2,
          borderColor: LayoutColor.greyD4D4D4,
          cornerRadius: 25,
          buttonAction: () {},
        ));
  }
}
