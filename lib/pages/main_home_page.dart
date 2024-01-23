import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/model/option.dart';
import 'package:fruit/pages/cart_page.dart';
import 'package:fruit/pages/home_page.dart';
import 'package:fruit/pages/sort_page.dart';
import 'package:fruit/pages/track_list_page.dart';
import 'package:fruit/pages/user_info.dart';
import 'package:fruit/widget/main_home/bottom_navigation.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    List<Option>? options = [
      Option(
        imageName: "ic_tab_home.png",
        title: "首頁",
        content: const HomePage(),
      ),
      Option(
        imageName: "ic_tab_sort.png",
        title: "商品分類",
        content: const SortPage(),
      ),
      Option(
        imageName: "ic_tab_list.png",
        title: "追蹤清單",
        content: TrackListPage(),
      ),
      Option(
        imageName: "ic_tab_shop.png",
        title: "購物車",
        content: const CartPage(),
      ),
      Option(
        imageName: "user_info.png",
        title: "個人帳戶",
        content: const UserInfoPage(),
      ),
    ];

    var selected = options.elementAt(selectedTab);

    return Scaffold(
      body: selected.content.center(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: selectedTab,
        options: options,
        onTap: (index) async {
          setState(() {
            selectedTab = index;
          });
        },
      ),
    );
  }
}
