class ItemModel {
  String? name;
  String? description;
  String? image;
  int? price;

  String? itemID;

  ItemModel({
    required this.itemID,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price,
    };
  }
}
