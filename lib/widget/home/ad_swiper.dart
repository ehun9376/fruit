import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:provider/provider.dart';

class AdSwiperViewModel extends ChangeNotifier {
  List<String> photoList = [
    "test_ad_1.png",
    "test_ad_1.png",
    "test_ad_1.png",
  ];

  int _index = 0;
  int get index => _index;

  set index(newValue) {
    _index = newValue;
    notifyListeners();
  }
}

class AdSwiper extends StatefulWidget {
  AdSwiper({super.key});

  @override
  State<AdSwiper> createState() => _AdSwiperState();
}

class _AdSwiperState extends State<AdSwiper> {
  AdSwiperViewModel? viewModel = AdSwiperViewModel();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    viewModel = null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Swiper(
          index: viewModel?.index ?? 0,
          itemBuilder: (context, index) {
            return SimpleImage(
              imageName: "test_ad_1.png",
              size: const Size(100, 100),
              cornerRadius: BorderRadius.circular(5),
            );
          },
          viewportFraction: 0.85,
          itemCount: 3,
          scale: 0.9,
          onIndexChanged: (value) {
            viewModel?.index = value;
          },
        ),
        Selector<AdSwiperViewModel, int>(
          selector: (p0, p1) => p1.index,
          builder: (context, value, child) {
            debugPrint("value: $value");
            return Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildPageIndicator(
                    viewModel?.photoList ?? [], viewModel?.index ?? 0),
              ),
            );
          },
        )
      ],
    )
        .changeNotifierProvider(value: viewModel ?? AdSwiperViewModel())
        .sizedBox(height: 162);
  }

  List<Widget> buildPageIndicator(List<String> photoList, int page) {
    var list = photoList
        .mapIndexed((index, element) => Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: page == index
                    ? LayoutColor.orangeF57C00
                    : LayoutColor.grey200,
              ),
            ))
        .toList();
    return list;
  }
}
