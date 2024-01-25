import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';

class SimpleTextField extends StatelessWidget {
  final TextInputType? keyboardType;

  final String? defaultText;

  final String? placeHolder;

  final Color? backgroundColor;

  final Function(String newValue)? editedAction;
  final Function(String newValue)? subAction;

  final double? cornerRadius;

  final Color? borderColor;

  final double? borderWidth;

  final int? maxLines;

  final bool? readOnly;

  final Function? onTap;

  final Widget? underLine;

  const SimpleTextField(
      {super.key,
      this.defaultText,
      this.backgroundColor,
      this.cornerRadius,
      this.borderColor = Colors.grey,
      this.borderWidth,
      this.placeHolder,
      this.editedAction,
      this.subAction,
      this.keyboardType,
      this.maxLines,
      this.readOnly,
      this.onTap,
      this.underLine});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: defaultText);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(cornerRadius ?? 0),
          ),
          child: TextField(
            readOnly: readOnly ?? false,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: LayoutColor.grey116,
            maxLines: maxLines,
            textInputAction: (maxLines ?? 1) > 1
                ? TextInputAction.newline
                : TextInputAction.done,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(cornerRadius ?? 0),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.grey,
                  width: borderWidth ?? 0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(cornerRadius ?? 0),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.grey,
                  width: borderWidth ?? 0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(cornerRadius ?? 0),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.blue,
                  width: borderWidth ?? 0,
                ),
              ),
              hintText: placeHolder,
            ),
            onChanged: editedAction,
            onSubmitted: subAction,
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
          ),
        ),
        if (underLine != null)
          const SizedBox(
            height: 7,
          ),
        if (underLine != null) underLine!,
      ],
    );
  }
}
