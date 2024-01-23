import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/layout/layout_guides.dart';
import 'package:fruit/widget/simpleWidget/simple_text.dart';
import 'package:fruit/widget/track/track_tag_row.dart';

class TrackTag extends StatelessWidget {
  const TrackTag(
      {super.key,
      required this.trackType,
      required this.currentTrackType,
      required this.onTypeChange});

  final TrackType trackType;
  final TrackType currentTrackType;
  final Function(TrackType) onTypeChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleText(
          text: trackType.title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        if (trackType == currentTrackType)
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 3,
            color: LayoutColor.orangeFB8C00,
          ),
        if (trackType != currentTrackType)
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 3,
          )
      ],
    ).inkWell(onTap: () {
      onTypeChange.call(trackType);
    });
  }
}
