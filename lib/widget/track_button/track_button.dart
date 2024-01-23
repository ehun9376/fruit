import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/model/item.dart';
import 'package:fruit/shared_model/track_items_model.dart';
import 'package:fruit/widget/simpleWidget/simple_image.dart';

class TrackButton extends StatefulWidget {
  const TrackButton({super.key, required this.trackItem});

  final ItemModel trackItem;

  @override
  State<TrackButton> createState() => _TrackButtonState();
}

class _TrackButtonState extends State<TrackButton> {
  final TrackItemsModol trackItemsModol = getIt<TrackItemsModol>();

  @override
  Widget build(BuildContext context) {
    bool isSelected = trackItemsModol.isTrackItem(widget.trackItem);

    return SimpleImage(
      imageName: isSelected ? "ic_tab_list_full.png" : "ic_tab_list.png",
      size: const Size(22, 20),
      color: isSelected ? LayoutColor.redED4427 : LayoutColor.grey969696,
    ).inkWell(onTap: () {
      setState(() {
        if (isSelected) {
          trackItemsModol.removeTrackItem(widget.trackItem);
        } else {
          trackItemsModol.addTrackItem(widget.trackItem);
        }
      });
    });
  }
}
