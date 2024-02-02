class AdListModel {
  List<AdModel>? adsList;

  AdListModel({this.adsList});

  AdListModel.fromJson(Map<String, dynamic> json) {
    if (json['adsList'] != null) {
      adsList = <AdModel>[];
      json['adsList'].forEach((v) {
        adsList!.add(AdModel.fromJson(v));
      });
    }
  }
}

class AdModel {
  String? id;
  String? title;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  AdModel({this.id, this.title, this.imageUrl, this.createdAt, this.updatedAt});

  AdModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
