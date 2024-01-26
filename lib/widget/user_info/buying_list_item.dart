import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class BuyingListItem extends StatelessWidget {
  const BuyingListItem({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withAlpha(128), width: 1),
        ),
        child: Center(
          child: SimpleText(
            text: title,
          ),
        ),
      ).inkWell(onTap: () {
        onTap?.call();
      }),
    );
  }
}
