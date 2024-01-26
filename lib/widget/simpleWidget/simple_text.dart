import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String? text;

  final int? lines;

  final double? fontSize;

  final FontWeight? fontWeight;

  final Color? textColor;

  final FontStyle? style;

  final TextAlign? align;

  final bool? autoFitWidth;

  final TextDecoration? decoration;

  final Alignment autoAlignment;

  const SimpleText(
      {Key? key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.textColor,
      this.lines,
      this.style,
      this.align,
      this.decoration = TextDecoration.none,
      this.autoAlignment = Alignment.center,
      this.autoFitWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((autoFitWidth ?? false) && (text?.isNotEmpty ?? false)) {
      return FittedBox(
        fit: BoxFit.scaleDown,
        alignment: autoAlignment,
        child: Text(
          (text ?? " ").tr(),
          softWrap: true,
          maxLines: lines ?? 999,
          overflow: TextOverflow.ellipsis,
          textAlign: align,
          style: TextStyle(
              decoration: decoration,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
              fontStyle: style),
        ),
      );
    } else {
      return Text(
        (text ?? "").tr(),
        softWrap: true,
        maxLines: lines ?? 999,
        overflow: TextOverflow.ellipsis,
        textAlign: align,
        style: TextStyle(
          decoration: decoration,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          fontStyle: style,
          fontFamily: "PingFangTC",
        ),
      );
    }
  }
}
