import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';

class SimpleCheckBox extends StatefulWidget {
  const SimpleCheckBox(
      {super.key, required this.selected, required this.onChange});
  final bool selected;
  final Function(bool) onChange;

  @override
  State<SimpleCheckBox> createState() => _SimpleCheckBoxState();
}

class _SimpleCheckBoxState extends State<SimpleCheckBox> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  void didUpdateWidget(SimpleCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: LayoutColor.orangeF57C00,
      hoverColor: LayoutColor.orangeF57C00,
      checkColor: LayoutColor.whiteFFFFFF,
      side: BorderSide(
        color: LayoutColor.orangeF57C00,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      value: selected,
      onChanged: (value) {
        setState(() {
          selected = value!;
        });
        widget.onChange(selected);
      },
    ).sizedBox(width: 26, height: 26);
  }
}
