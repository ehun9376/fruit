import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/coupon/coupon_model.dart';
import 'package:fruit/model/point_history/point_history.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:fruit/widget/command/ec10_divider.dart';
import 'package:fruit/widget/command/title_subtitle_row.dart';
import 'package:fruit/widget/coupon/coupon_card.dart';
import 'package:fruit/widget/coupon/coupon_poing_row.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';
import 'package:provider/provider.dart';
import '../extension/extension.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

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
          Selector<AppUserEnvironmentModel, int?>(
            selector: (p0, p1) => p1.currentUser?.point,
            builder: (context, value, child) {
              return CouponPointRow(point: value ?? 0);
            },
          ),
          const TitleSubTitleMoreRow(
            title: "使用紀錄",
          ).padding(const EdgeInsets.only(top: 20, bottom: 10)),
          const Divider().padding(const EdgeInsets.only(left: 20, right: 20)),
          Selector<AppUserEnvironmentModel, List<PointModel>?>(
            selector: (p0, p1) => p1.pointHistory?.list,
            builder: (context, value, child) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (value?.length ?? 0) <= 5 ? (value?.length ?? 0) : 5,
                itemBuilder: (BuildContext context, int index) {
                  if (value == null || index >= value.length) {
                    return Container();
                  }
                  return TitleSubTitleMoreRow(
                    title: value[index].createdAt ?? "",
                    subTitle:
                        "${value[index].actionText()} ${value[index].points} 點",
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
          Selector<AppUserEnvironmentModel, List<CouponModel>>(
            selector: (p0, p1) => p1.couponHistory,
            builder: (context, value, child) {
              return Column(
                children: value
                    .mapIndexed(
                        (index, element) => CouponCard(couponModel: element))
                    .toList(),
              );
            },
          ),
        ],
      ).singleChildScrollView(),
    );
  }
}
