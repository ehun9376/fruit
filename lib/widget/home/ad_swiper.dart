import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/ad_model.dart';
import 'package:fruit/shared_model/home_page_model.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';
import 'package:provider/provider.dart';

class AdSwiperViewModel extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

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
    return Selector<HomePageModel, List<AdModel>?>(
      selector: (p0, p1) => p1.adListModel?.adsList,
      builder: (context, adsList, child) {
        return Stack(
          children: [
            Swiper(
              index: viewModel.index,
              itemBuilder: (context, index) {
                if (adsList?.isEmpty ?? false) {
                  return Container();
                }
                return SimpleImage(
                  imageURL: adsList?[index].imageUrl,
                  size: const Size(100, 100),
                  cornerRadius: BorderRadius.circular(5),
                );
              },
              viewportFraction: 0.85,
              itemCount: adsList?.length ?? 0,
              scale: 0.9,
              onIndexChanged: (value) {
                viewModel.index = value;
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
                        adsList?.map((e) => e.imageUrl ?? "").toList() ?? [],
                        viewModel.index),
                  ),
                );
              },
            )
          ],
        ).sizedBox(height: 162);
      },
    ).changeNotifierProvider(value: viewModel);
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
