import 'package:flutter/material.dart';
import 'package:fruit/extension/extension.dart';
import 'package:fruit/widget/track/track_tagdart.dart';

enum TrackType { track, history }

extension TrackTypeValue on TrackType {
  String get title {
    switch (this) {
      case TrackType.track:
        return "追蹤商品";
      case TrackType.history:
        return "瀏覽紀錄";
      default:
        return "";
    }
  }
}

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
        TrackTag(
          trackType: TrackType.track,
          currentTrackType: trackType,
          onTypeChange: (type) {
            setState(() {
              trackType = type;
              widget.onTypeChange.call(type);
            });
          },
        ).flexible(),
        TrackTag(
          trackType: TrackType.history,
          currentTrackType: trackType,
          onTypeChange: (type) {
            setState(() {
              trackType = type;
              widget.onTypeChange.call(type);
            });
          },
        ).flexible(),
      ],
    );
  }
}
