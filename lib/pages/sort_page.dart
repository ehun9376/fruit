import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/home/search_bar.dart';
import 'package:fruit/widget/sort/item_list_card.dart';
import 'package:fruit/widget/sort/sort_filter.dart';

class SortPage extends StatelessWidget {
  const SortPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: LayoutColor.orangeF57C00,
        ),
      ),
      body: Column(children: [
        SearchBarRow(
          onSearchBarSubmitted: (searchText) {},
          showButtons: false,
        ),
        const SortFiltterRow(),
        ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const ItemListCard();
          },
        ).container(color: LayoutColor.whiteF5F5F5).flexible(),
      ]).safeArea(),
    );
  }
}
