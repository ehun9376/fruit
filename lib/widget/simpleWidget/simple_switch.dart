import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fruit/layout/layout_guides.dart';

class SimpleSwitch extends StatefulWidget {
  const SimpleSwitch({
    super.key,
    required this.selected,
    required this.onToggle,
    this.width,
    this.height,
    this.toggleSize,
  });
  final bool selected;
  final Function(bool) onToggle;
  final double? width;
  final double? height;
  final double? toggleSize;

  @override
  State<SimpleSwitch> createState() => _SimpleSwitchState();
}

class _SimpleSwitchState extends State<SimpleSwitch> {
  bool selected = false;
  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      activeColor: LayoutColor.pinkEC588A,
      activeToggleColor: LayoutColor.whiteFFFFFFF,
      activeSwitchBorder: Border.all(color: LayoutColor.pinkEC588A, width: 2),
      width: widget.width ?? 45,
      height: widget.height ?? 25,
      valueFontSize: 14,
      toggleSize: widget.toggleSize ?? 20,
      value: selected,
      borderRadius: 15.0,
      showOnOff: false,
      onToggle: (newValue) {
        setState(() {
          selected = !selected;
        });
        widget.onToggle(selected);
      },
    );
  }
}
