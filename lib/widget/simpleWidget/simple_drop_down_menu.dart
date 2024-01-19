import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

abstract class MenuItemModel {
  late String displayName;
}

class MenuItem implements MenuItemModel {
  @override
  late String displayName;
  late dynamic value;
  MenuItem({required this.displayName, required this.value});
}

class SimpleDropdownMenu<T extends MenuItemModel> extends StatefulWidget {
  const SimpleDropdownMenu(
      {super.key,
      required this.onChange,
      required this.options,
      this.defaultValue});

  @override
  SimpleDropdownMenuState<T> createState() => SimpleDropdownMenuState<T>();

  final Function(T) onChange;
  final List<T> options;
  final T? defaultValue;
}

class SimpleDropdownMenuState<T extends MenuItemModel>
    extends State<SimpleDropdownMenu<T>> {
  T? _selectedItem;
  late final List<T> _dropdownItems;
  late final Function(T) onChange;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.defaultValue;
    _dropdownItems = widget.options;
    onChange = widget.onChange;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      isExpanded: true,
      padding: const EdgeInsets.only(left: 5),
      borderRadius: BorderRadius.circular(15),
      hint: const SimpleText(
        text: "Please Select",
      ),
      underline: Container(
        height: 1,
        color: LayoutColor.grey969696,
      ),
      value: _dropdownItems.isNotEmpty
          ? _dropdownItems.firstWhere(
              (element) => element.displayName == _selectedItem?.displayName)
          : null,
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        if (newValue != null) {
          onChange(newValue);
        }
      },
      items: _dropdownItems.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: SimpleText(text: item.displayName),
        );
      }).toList(),
    );
  }
}
