import 'package:flutter/material.dart';

typedef BuildWidget = FloatingActionButton Function(BuildContext);
typedef InitAction = Future<void> Function(BuildContext);

class Option {
  String? imageName;
  Widget? icon;
  String? title;
  final Widget content;
  BuildWidget? floatingAction;
  InitAction? onTap;

  Option({
    this.imageName,
    this.icon,
    this.title,
    required this.content,
    this.floatingAction,
    this.onTap,
  });
}
