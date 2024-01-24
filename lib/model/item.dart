class ItemModel {
  String? itemName;
  String? description;
  String? imageURL;
  int? price;

  String? itemID;
  String? storeID;
  String? storeName;

  int quantity = 1;

  bool isSelected = false;

  ItemModel({
    this.itemID,
    this.itemName,
    this.description,
    this.imageURL,
    this.price,
    this.storeID,
    this.storeName,
    this.quantity = 1,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    itemName = json['name'];
    description = json['description'];
    imageURL = json['image'];
    price = json['price'];
    storeID = json['storeID'];
    storeName = json['storeName'];
    quantity = json['quantity'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': itemName,
      'description': description,
      'image': imageURL,
      'price': price,
      'itemID': itemID,
      'storeID': storeID,
      'storeName': storeName,
      'quantity': quantity,
    };
  }
}
