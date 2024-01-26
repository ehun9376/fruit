abstract class TabProtocol {
  String get title;
}

enum TrackType implements TabProtocol {
  track,
  history;

  @override
  String get title {
    switch (this) {
      case TrackType.track:
        return "追蹤商品";
      case TrackType.history:
        return "瀏覽紀錄";
    }
  }
}

enum NoticeType implements TabProtocol {
  active,
  order,
  discount;

  @override
  String get title {
    switch (this) {
      case NoticeType.active:
        return "活動";
      case NoticeType.order:
        return "訂單";
      case NoticeType.discount:
        return "優惠";
    }
  }
}
