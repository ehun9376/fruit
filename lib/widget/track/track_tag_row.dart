import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';

enum TrackType { track, history }

class TrackTagRow extends StatefulWidget {
  const TrackTagRow(
      {super.key, required this.onTypeChange, required this.trackType});

  final Function(TrackType) onTypeChange;

  final TrackType trackType;

  @override
  State<TrackTagRow> createState() => _TrackTagRowState();
}

class _TrackTagRowState extends State<TrackTagRow> {
  late TrackType trackType;

  @override
  void initState() {
    super.initState();
    trackType = widget.trackType;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const SimpleText(
              text: "追蹤商品",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            if (trackType == TrackType.track)
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 3,
                color: LayoutColor.orangeFB8C00,
              )
          ],
        ).inkWell(onTap: () {
          setState(() {
            trackType = TrackType.track;
            widget.onTypeChange.call(TrackType.track);
          });
        }).flexible(),
        Column(
          children: [
            const SimpleText(
              text: "瀏覽紀錄",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            if (trackType == TrackType.history)
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 3,
                color: LayoutColor.orangeFB8C00,
              )
          ],
        ).inkWell(onTap: () {
          setState(() {
            trackType = TrackType.history;
            widget.onTypeChange.call(TrackType.history);
          });
        }).flexible()
      ],
    );
  }
}
