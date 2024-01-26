import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/widget/tabButton/tab_button.dart';
import 'package:fruit/widget/tabButton/tab_protocol.dart';

class TabRow<T extends TabProtocol> extends StatelessWidget {
  const TabRow(
      {super.key,
      required this.onTypeChange,
      required this.currentType,
      required this.types});

  final List<T> types;

  final Function(T) onTypeChange;

  final T currentType;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: types
            .map(
              (e) => TabButton<T>(
                trackType: e,
                currentTrackType: currentType,
                onTypeChange: (type) {
                  onTypeChange(e);
                },
              ).flexible(),
            )
            .toList());
  }
}
