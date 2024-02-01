class PointHistoryModel {
  List<PointModel>? list;

  PointHistoryModel({this.list});

  factory PointHistoryModel.fromJson(Map<String, dynamic> json) {
    return PointHistoryModel(
      list: (json['list'] as List).map((e) => PointModel.fromJson(e)).toList(),
    );
  }
}

class PointModel {
  String? id;
  String? user;
  int? points;
  String? action;
  String? reason;
  String? createdAt;
  String? updatedAt;

  String actionText() {
    switch (action) {
      case "add":
        return "+";
      case "minus":
        return "-";
      default:
        return "";
    }
  }

  PointModel({
    this.id,
    this.user,
    this.points,
    this.action,
    this.reason,
    this.createdAt,
    this.updatedAt,
  });

  factory PointModel.fromJson(Map<String, dynamic> json) {
    return PointModel(
      id: json['_id'],
      user: json['user'],
      points: json['points'],
      action: json['action'],
      reason: json['reason'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
