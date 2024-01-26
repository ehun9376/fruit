import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/coupon/coupon_history_model.dart';
import 'package:fruit/model/coupon/coupon_model.dart';
import 'package:fruit/widget/command/ec10_divider.dart';
import 'package:fruit/widget/command/title_subtitle_row.dart';
import 'package:fruit/widget/coupon/coupon_card.dart';
import 'package:fruit/widget/coupon/coupon_poing_row.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';
import 'package:provider/provider.dart';
import '../extension/extension.dart';

class CouponPageViewModel extends ChangeNotifier {
  int _point = 0;
  int get point => _point;
  set point(int value) {
    _point = value;
    notifyListeners();
  }

  List<CouponHistoryModel> _couponHistory = [
    CouponHistoryModel(createdAt: "2021-08-01", pointChange: "100"),
    CouponHistoryModel(createdAt: "2021-08-01", pointChange: "100"),
    CouponHistoryModel(createdAt: "2021-08-01", pointChange: "100"),
    CouponHistoryModel(createdAt: "2021-08-01", pointChange: "100"),
  ];

  List<CouponHistoryModel> get couponHistory => _couponHistory;
  set couponHistory(List<CouponHistoryModel> value) {
    _couponHistory = value;
    notifyListeners();
  }

  List<CouponModel> _couponModels = [
    CouponModel(type: "下載App優惠", value: "立即下載，下載後可領取免費兩顆蘋果優惠券"),
    CouponModel(type: "下載App優惠", value: "立即下載，下載後可領取免費兩顆蘋果優惠券"),
    CouponModel(type: "下載App優惠", value: "立即下載，下載後可領取免費兩顆蘋果優惠券"),
    CouponModel(type: "下載App優惠", value: "立即下載，下載後可領取免費兩顆蘋果優惠券"),
    CouponModel(type: "下載App優惠", value: "立即下載，下載後可領取免費兩顆蘋果優惠券")
  ];

  List<CouponModel> get couponModels => _couponModels;
  set couponModels(List<CouponModel> value) {
    _couponModels = value;
    notifyListeners();
  }
}

class CouponPage extends StatelessWidget {
  CouponPage({super.key});

  final CouponPageViewModel viewModel = CouponPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: LayoutColor.orangeF57C00,
        ),
        title: SimpleText(
          text: "會員點數",
          fontSize: 17,
          textColor: LayoutColor.black212121,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: LayoutColor.orangeF57C00,
      ),
      body: Column(
        children: [
          Selector<CouponPageViewModel, int>(
            selector: (p0, p1) => p1.point,
            builder: (context, value, child) {
              return CouponPointRow(point: value);
            },
          ),
          const TitleSubTitleMoreRow(
            title: "使用紀錄",
          ).padding(const EdgeInsets.only(top: 20, bottom: 10)),
          const Divider().padding(const EdgeInsets.only(left: 20, right: 20)),
          Selector<CouponPageViewModel, List<CouponHistoryModel>>(
            selector: (p0, p1) => p1.couponHistory,
            builder: (context, value, child) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= value.length) {
                    return Container();
                  }

                  return TitleSubTitleMoreRow(
                    title: value[index].createdAt ?? "",
                    subTitle: "${value[index].pointChange} 點",
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider()
                      .padding(const EdgeInsets.only(left: 20, right: 20));
                },
              );
            },
          ),
          const EC10Divider(),
          const TitleSubTitleMoreRow(title: "我的優惠券")
              .padding(const EdgeInsets.symmetric(vertical: 20)),
          Selector<CouponPageViewModel, List<CouponModel>>(
            selector: (p0, p1) => p1.couponModels,
            builder: (context, value, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return CouponCard(couponModel: value[index]);
                },
              );
            },
          ),
        ],
      ).singleChildScrollView().changeNotifierProvider(value: viewModel),
    );
  }
}
