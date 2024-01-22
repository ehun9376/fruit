import 'package:flutter/material.dart';

class ItemGridCard extends StatelessWidget {
  const ItemGridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 200, // 项目的背景颜色
      child: const Center(
        child: Text(
          "AAA",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
