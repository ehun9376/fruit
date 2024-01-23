import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';

class AdSwiperViewModel extends ChangeNotifier {
  int get index => _index;
  int _index = 0;
  set index(newValue) {
    _index = newValue;
    notifyListeners();
  }
}

class AdSwiper extends StatelessWidget {
  AdSwiper({super.key});

  final AdSwiperViewModel viewModel = AdSwiperViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Swiper(
          index: 0,
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
          onIndexChanged: (value) async {},
        ),
      ],
    ).sizedBox(height: 162);
  }

  List<Widget> _buildPageIndicator(List<String> photoList, int page) {
    var list = photoList
        .mapIndexed((index, element) => Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: page == index
                    ? LayoutColor.colorPurple231_214_236
                    : LayoutColor.grey200,
              ),
            ))
        .toList();
    return list;
  }
}
