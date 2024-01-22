import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/home/ad_swiper.dart';
import 'package:fruit/widget/home/search_bar.dart';
import 'package:fruit/widget/home/tag_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LayoutColor.orangeF57C00,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                color: LayoutColor.orangeF57C00,
                child: SearchBarRow(
                  onSearchBarSubmitted: (searchText) {},
                  onHistoryClick: () {},
                  onNoticeClick: () {},
                ),
              ),
              AdSwiper(),
              TagRow(),
            ],
          ),
        ),
      ),
    );
  }
}
