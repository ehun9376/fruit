import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

class DefaultScaffold extends StatelessWidget {
  final String? navigationTitle;
  final Widget? body;
  final bool showAppBar;
  final bool showBannerAd;
  const DefaultScaffold(
      {Key? key,
      this.navigationTitle,
      required this.body,
      required this.showBannerAd,
      required this.showAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: showAppBar
            ? AppBar(
                backgroundColor: LayoutColor.whiteFFFFFFF,
                iconTheme: IconThemeData(color: LayoutColor.black000000),
                title: SimpleText(
                    text: navigationTitle?.tr(),
                    textColor: LayoutColor.black000000))
            : null,
        body: body,
        persistentFooterButtons: null);
  }
}
