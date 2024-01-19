import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/option.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<Option> options;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.options,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(index);
  }

  Widget _buildIcon(String image, String text, int index) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 12),
        height: kBottomNavigationBarHeight + 23,
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SimpleImage(
                imageName: image,
                size: const Size(24, 24),
                color: _selectedIndex == index
                    ? LayoutColor.orangeF57C00
                    : LayoutColor.orangeF57C00.withAlpha(76),
              ),
              if (text.isNotEmpty)
                SimpleText(
                  text: text,
                  fontSize: 10,
                  autoFitWidth: true,
                  fontWeight: FontWeight.w600,
                  textColor: _selectedIndex == index
                      ? LayoutColor.orangeF57C00
                      : LayoutColor.orangeF57C00.withAlpha(76),
                ).sizedBox(height: 20),
            ],
          ),
          onTap: () => _onItemTapped(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: kBottomNavigationBarHeight + 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: widget.options
            .mapIndexed((index, element) =>
                _buildIcon(element.imageName ?? "", element.title ?? "", index))
            .toList(),
      ),
    );
  }
}
