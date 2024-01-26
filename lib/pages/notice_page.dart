import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';
import 'package:fruit/widget/tabButton/tab_button_row.dart';
import 'package:provider/provider.dart';

class NoticePageViewModel extends ChangeNotifier {
  NoticeType _noticeType = NoticeType.active;
  NoticeType get noticeType => _noticeType;
  set noticeType(NoticeType value) {
    _noticeType = value;
    notifyListeners();
  }
}

class NoticePage extends StatelessWidget {
  NoticePage({super.key});

  final NoticePageViewModel viewModel = NoticePageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: LayoutColor.whiteFFFFFF,
          ),
          title: SimpleText(
            text: "通知中心",
            fontSize: 17,
            textColor: LayoutColor.black212121,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: LayoutColor.whiteFFFFFF,
        ),
        body: Column(
          children: [
            Selector<NoticePageViewModel, NoticeType>(
              selector: (p0, p1) => p1.noticeType,
              builder: (context, value, child) {
                return TabRow<NoticeType>(
                  types: NoticeType.values,
                  currentType: value,
                  onTypeChange: (type) {
                    viewModel.noticeType = type;
                  },
                );
              },
            ),
          ],
        ).changeNotifierProvider(value: viewModel));
  }
}
