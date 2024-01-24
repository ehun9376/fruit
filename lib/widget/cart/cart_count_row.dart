import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CartCountRow extends StatefulWidget {
  const CartCountRow(
      {super.key, required this.defaultCount, required this.onCountChange});

  final int defaultCount;
  final Function(int) onCountChange;

  @override
  State<CartCountRow> createState() => _CartCountRowState();
}

class _CartCountRowState extends State<CartCountRow> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    count = widget.defaultCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: LayoutColor.greyE7E7E7, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          SimpleImage(
            icon: Icons.remove,
            iconSize: 20,
            color: LayoutColor.grey969696,
          ).inkWell(onTap: () {
            if (count > 0) {
              setState(() {
                count--;
                widget.onCountChange.call(count);
              });
            }
          }),
          SimpleText(
            text: "$count",
            fontSize: 15,
          ).padding(const EdgeInsets.symmetric(horizontal: 10)),
          SimpleImage(
            icon: Icons.add,
            iconSize: 20,
            color: LayoutColor.grey969696,
          ).inkWell(onTap: () {
            setState(() {
              count++;
              widget.onCountChange.call(count);
            });
          }),
        ],
      ),
    );
  }
}
