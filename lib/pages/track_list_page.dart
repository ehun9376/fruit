import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/shared_model/track_items_model.dart';
import 'package:fruit/widget/item_grid/item_grid.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';
import 'package:fruit/widget/track/track_tag_row.dart';
import 'package:provider/provider.dart';

class TrackListPageViewModel extends ChangeNotifier {
  TrackType _trackType = TrackType.track;
  TrackType get trackType => _trackType;
  set trackType(TrackType value) {
    _trackType = value;
    notifyListeners();
  }
}

class TrackListPage extends StatelessWidget {
  TrackListPage({super.key});

  final TrackListPageViewModel viewModel = TrackListPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: LayoutColor.whiteFFFFFF,
        ),
        title: SimpleText(
          text: "追蹤清單",
          fontSize: 17,
          textColor: LayoutColor.black212121,
          fontWeight: FontWeight.w600,
        ),
        leading: Container(),
        backgroundColor: LayoutColor.whiteFFFFFF,
      ),
      body: ChangeNotifierProvider.value(
          value: viewModel,
          builder: (context, snapshot) {
            return Column(
              children: [
                TrackTagRow(
                  trackType: viewModel.trackType,
                  onTypeChange: (type) {
                    viewModel.trackType = type;
                  },
                ),
                Selector<TrackListPageViewModel, TrackType>(
                  selector: (p0, p1) => p1.trackType,
                  builder: (context, value, child) {
                    return Selector<TrackItemsModol, List<ItemModel>>(
                        selector: (p0, p1) {
                      if (value == TrackType.track) {
                        return p1.trackItems;
                      } else {
                        return p1.historyItems;
                      }
                    }, builder: (context, value, child) {
                      return ItemGrid(
                        data: value,
                        scrollEnable: true,
                      )
                          .padding()
                          .container(color: LayoutColor.greyF6F6F6)
                          .flexible();
                    });
                  },
                )
              ],
            );
          }),
    );
  }
}
