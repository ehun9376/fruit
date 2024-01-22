import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';

class SearchBarRow extends StatelessWidget {
  const SearchBarRow(
      {super.key,
      required this.onSearchBarSubmitted,
      required this.onHistoryClick,
      required this.onNoticeClick});

  final Function(String) onSearchBarSubmitted;
  final Function onHistoryClick;
  final Function onNoticeClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LayoutColor.orangeF57C00,
      child: Row(
        children: [
          SearchBar(
            shadowColor: MaterialStateProperty.resolveWith<Color>(
                (states) => LayoutColor.clear),
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                (states) => TextStyle(color: LayoutColor.orangeF57C00)),
            leading: SimpleImage(
              icon: Icons.search,
              color: LayoutColor.orangeF57C00,
            ).padding(const EdgeInsets.only(left: 10)),
            onSubmitted: (value) {},
          )
              .sizedBox(height: 35)
              .padding(const EdgeInsets.only(right: 10))
              .flexible(),
          const SimpleImage(
            icon: Icons.history,
            iconSize: 30,
            color: Colors.white,
          ).padding(const EdgeInsets.only(right: 10)).inkWell(onTap: () {}),
          const SimpleImage(
            icon: Icons.notifications_none_outlined,
            iconSize: 30,
            color: Colors.white,
          ).padding(const EdgeInsets.only(right: 10)).inkWell(onTap: () {})
        ],
      ).padding(),
    );
  }
}
