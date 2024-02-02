import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/widget/simpleWidget/simple_drop_down_menu.dart';

class SortFiltterRow extends StatelessWidget {
  const SortFiltterRow({super.key});

  @override
  Widget build(BuildContext context) {
    List<FilterOption> filterOption1 = [
      FilterOption(display: "年節禮盒", value: "1"),
      FilterOption(display: "公司送禮", value: "1")
    ];
    List<FilterOption> filterOption2 = [
      FilterOption(display: "產地直送", value: "1"),
      FilterOption(display: "當季限定", value: "1")
    ];
    List<FilterOption> filterOption3 = [
      FilterOption(display: "其他分類", value: "1"),
      FilterOption(display: "公司送禮", value: "1")
    ];

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SimpleDropdownMenu<FilterOption>(
                defaultValue: filterOption1.first,
                onChange: (model) {},
                options: filterOption1),
            Container(
              width: 1,
              height: 15,
              color: Colors.grey,
            ),
            SimpleDropdownMenu<FilterOption>(
                defaultValue: filterOption2.first,
                onChange: (model) {},
                options: filterOption2),
            Container(
              width: 1,
              height: 15,
              color: Colors.grey,
            ),
            SimpleDropdownMenu<FilterOption>(
                defaultValue: filterOption3.first,
                onChange: (model) {},
                options: filterOption3)
          ],
        ).container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        Divider(
          height: 1,
          color: Colors.grey.withAlpha(80),
        )
      ],
    );
  }
}

class FilterOption extends MenuItemModel {
  FilterOption({
    required this.display,
    required this.value,
  });

  String display;
  String value;

  @override
  String get displayName => display;
}
