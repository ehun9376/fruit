import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiver/iterables.dart';

extension Styles on Widget {
  Widget buildBorderAround({required BuildContext context}) {
    return sizedBox(
      height: 120,
    )
        .container(
            decoration: BoxDecoration(
                border: Border.all(
          width: 1,
          color: Theme.of(context).dividerColor,
        )))
        .padding(const EdgeInsets.symmetric(horizontal: 20));
  }

  SizedBox sizedBox({double? width, double? height}) {
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }

  Widget card() {
    return Card(
      child: this,
    );
  }

  Widget center() {
    return Center(child: this);
  }

  Widget shadow() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: this);
  }

  Widget padding([EdgeInsets defaultValue = const EdgeInsets.all(20)]) {
    return Padding(
      padding: defaultValue,
      child: this,
    );
  }

  Flexible flexible([int defaultValue = 1, FlexFit fit = FlexFit.tight]) {
    return Flexible(
      flex: defaultValue,
      fit: fit,
      child: this,
    );
  }

  Widget safeArea() {
    return SafeArea(child: this);
  }

  Widget container({
    Color? color,
    BoxConstraints? constraints,
    Decoration? decoration,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      padding: padding,
      decoration: decoration,
      color: color,
      constraints: constraints,
      child: this,
    );
  }

  Widget singleChildScrollView({Axis scrollDirection = Axis.vertical}) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      child: this,
    );
  }

  Widget align() {
    return Align(
      child: this,
    );
  }

  Widget animatedSwitcher() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: this,
    );
  }

  Widget widgetWithRow(
      [MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start]) {
    return Row(
      children: [this],
    );
  }
}

extension Layouts on List<Widget> {
  Widget column([
    MainAxisAlignment mainDefault = MainAxisAlignment.center,
    CrossAxisAlignment crossDefault = CrossAxisAlignment.center,
  ]) {
    return Column(
      mainAxisAlignment: mainDefault,
      crossAxisAlignment: crossDefault,
      children: this,
    );
  }

  Row row([MainAxisAlignment defaultValue = MainAxisAlignment.center]) {
    return Row(
      mainAxisAlignment: defaultValue,
      children: this,
    );
  }

  Widget twoColumn() {
    var splited = partition(this, 2).toList();
    var twoColumn = splited
        .map((e) => e.row(MainAxisAlignment.start))
        .toList()
        .column(MainAxisAlignment.start)
        .padding(const EdgeInsets.all(10));
    return twoColumn;
  }

  Widget listView({
    Axis scrollDirection = Axis.vertical,
  }) {
    return ListView(
      scrollDirection: scrollDirection,
      children: this,
    );
  }

  Widget stack({
    AlignmentDirectional alignment = AlignmentDirectional.topEnd,
  }) {
    return Stack(
      alignment: alignment,
      children: this,
    );
  }
}

extension Actions on Widget {
  Widget addLoadMoreBehavior({
    required Future Function() loadMore,
    Function()? scrollDownAction,
    Function()? scrollUpAction,
  }) {
    return notificationListener<UserScrollNotification>(onNotification: ((p0) {
      // debugPrint("還有多少到底 ${p0.metrics.extentAfter}");
      // debugPrint("最多有多少 ${p0.metrics.maxScrollExtent}");
      // debugPrint("direction ${p0.direction}");
      if (p0.metrics.extentAfter < 100) {
        loadMore();
      }
      if (p0.direction == ScrollDirection.reverse) {
        scrollDownAction?.call();
      }
      if (p0.direction == ScrollDirection.forward) {
        scrollUpAction?.call();
      }
      return true;
    }));
  }

  Widget notificationListener<T extends Notification>({
    bool Function(T)? onNotification,
  }) {
    return NotificationListener<T>(
      onNotification: onNotification,
      child: this,
    );
  }

  InkWell inkWell({GestureTapCallback? onTap}) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: this,
    );
  }
}

extension NumberExtension on int {
  bool andOperation(int otherNumber) {
    return this & otherNumber > 0;
  }
}
