import 'package:flutter/material.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/widget/item_grid/item_grid_card.dart';

class ItemGrid extends StatelessWidget {
  final List<ItemModel> data;

  const ItemGrid({super.key, required this.scrollEnable, required this.data});

  final bool scrollEnable;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: scrollEnable ? null : const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1 / 1.52,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ItemGridCard(
          itemModel: data[index],
        );
      },
    );
  }
}
