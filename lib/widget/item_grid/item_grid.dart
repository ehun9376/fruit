import 'package:flutter/material.dart';
import 'package:fruit/widget/item_grid/item_grid_card.dart';

class ItemGrid extends StatelessWidget {
  final List<String> data = List.generate(50, (index) => 'Item $index');

  ItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // 禁用滚动
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1 / 1.52,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return const ItemGridCard();
      },
    );
  }
}
