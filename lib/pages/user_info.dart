import 'package:flutter/material.dart';
import 'package:fruit/config.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/routes.dart';
import 'package:fruit/widget/command/full_row_button.dart';
import 'package:fruit/widget/command/title_subtitle_row.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';
import 'package:fruit/widget/snack/snackbar_helper.dart';
import 'package:fruit/widget/user_info/buying_list_item.dart';

enum UserInfoPageType {
  userInfo,
  memberPoint,
  changePassword,
  helpService,
  contactUs,
  aboutUs,
  noticeSetting
}

extension UserInfoPageTypeExtension on UserInfoPageType {
  String get title {
    switch (this) {
      case UserInfoPageType.userInfo:
        return "個人資料";
      case UserInfoPageType.memberPoint:
        return "會員點數";
      case UserInfoPageType.changePassword:
        return "修改密碼";
      case UserInfoPageType.helpService:
        return "幫助中心";
      case UserInfoPageType.contactUs:
        return "聯絡客服";
      case UserInfoPageType.aboutUs:
        return "關於我們";
      case UserInfoPageType.noticeSetting:
        return "通知設定";
      default:
        return "";
    }
  }
}

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsList = [];

    widgetsList.addAll(UserInfoPageType.values.map((e) {
      if (e == UserInfoPageType.memberPoint) {
        return buildUserInfoRow(type: e, subTitle: "0 點");
      } else {
        return buildUserInfoRow(type: e);
      }
    }).toList(growable: false));

    widgetsList.add(FullRowButton(
      buttonTitle: "登出",
      type: FullRowButtonType.orangeBgWhiteTitle,
      buttonAction: () {
        showConfirmDialog(
            title: "提示",
            current: "確定要登出嗎",
            rightButtonOnTap: () {
              navigatorKey.currentState
                  ?.pushNamedAndRemoveUntil(loginPageRoute, (route) => false);
            });
      },
    ).padding(const EdgeInsets.symmetric(horizontal: 50, vertical: 20)));

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: LayoutColor.whiteFFFFFF,
          ),
          title: SimpleText(
            text: "個人中心",
            fontSize: 17,
            textColor: LayoutColor.black212121,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: LayoutColor.whiteFFFFFF,
        ),
        body: Column(
          children: [
            const TitleSubTitleMoreRow(
              title: "購買清單",
              subTitle: "查看更多",
            ).padding(const EdgeInsets.only(right: 10)).inkWell(
                  onTap: () {},
                ),
            Row(
              children: [
                BuyingListItem(
                  title: "待付款",
                  onTap: () {},
                ).flexible(),
                BuyingListItem(
                  title: "待出貨",
                  onTap: () {},
                ).flexible(),
                BuyingListItem(
                  title: "待收貨",
                  onTap: () {},
                ).flexible(),
                BuyingListItem(
                  title: "退換貨",
                  onTap: () {},
                ).flexible()
              ],
            ).sizedBox(
              height: 100,
            ),
            Container(
              height: 10,
              color: LayoutColor.greyECECEC,
            ),
            const TitleSubTitleMoreRow(title: "帳戶相關")
                .padding(const EdgeInsets.only(bottom: 15, top: 15)),
            ListView.separated(
                itemCount: widgetsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return widgetsList[index];
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider()
                      .padding(const EdgeInsets.only(left: 40));
                }).flexible(),
          ],
        ));
  }

  Widget buildUserInfoRow({required UserInfoPageType type, String? subTitle}) {
    return TitleSubTitleMoreRow(
      title: type.title,
      titleFontSize: 14,
      subTitle: subTitle,
      showMoreIcon: true,
    ).padding(const EdgeInsets.only(left: 20)).inkWell(onTap: () {
      switch (type) {
        case UserInfoPageType.userInfo:
          break;
        case UserInfoPageType.memberPoint:
          break;
        case UserInfoPageType.changePassword:
          break;
        case UserInfoPageType.helpService:
          break;
        case UserInfoPageType.contactUs:
          break;
        case UserInfoPageType.aboutUs:
          break;
        case UserInfoPageType.noticeSetting:
          break;
      }
    });
  }
}
