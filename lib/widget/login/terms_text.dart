import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '登入即代表同意',
        style: TextStyle(color: LayoutColor.grey515151, fontSize: 12),
        children: <TextSpan>[
          TextSpan(
              text: '使用條款',
              style: TextStyle(
                color: LayoutColor.orangeF57C00,
                decoration: TextDecoration.underline,
                decorationColor: LayoutColor.orangeF57C00,
                decorationThickness: 1.0,
              )),
          const TextSpan(text: '和'),
          TextSpan(
            text: '隱私權政策',
            style: TextStyle(
              color: LayoutColor.orangeF57C00,
              decoration: TextDecoration.underline,
              decorationColor: LayoutColor.orangeF57C00,
              decorationThickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
