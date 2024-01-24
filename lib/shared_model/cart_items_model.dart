import 'package:flutter/material.dart';
import 'package:fruit/model/item.dart';

class CartItemsModel extends ChangeNotifier {
  List<List<ItemModel>> _cartItems = [
    [
      ItemModel(itemName: "test"),
      ItemModel(itemName: "test"),
      ItemModel(itemName: "test")
    ],
    [ItemModel(itemName: "test")]
  ];

  List<List<ItemModel>> get cartItems => _cartItems;
  set cartItems(List<List<ItemModel>> value) {
    _cartItems = value;
    notifyListeners();
  }

  void addCartItem(ItemModel cartItem) {
    List<List<ItemModel>> tempList = cartItems;
    if (tempList
        .firstWhere((element) => element.first.storeID == cartItem.storeID,
            orElse: () => [])
        .isEmpty) {
      tempList.add([cartItem]);
    } else {
      tempList
          .firstWhere((element) => element.first.storeID == cartItem.storeID)
          .add(cartItem);
    }
    cartItems = tempList;
    notifyListeners();
  }

  void removeCartItem(ItemModel cartItem) {
    List<List<ItemModel>> tempList = cartItems;
    tempList
        .firstWhere((element) => element.first.storeID == cartItem.storeID)
        .remove(cartItem);
    cartItems = tempList;
    notifyListeners();
  }

  void clearCartItems() {
    List<List<ItemModel>> tempList = cartItems;

    tempList.clear();
    cartItems = tempList;
    notifyListeners();
  }

  int get totalPrice => _cartItems
      .map((e) => e
          .map((e) => (e.price ?? 0))
          .reduce((value, element) => value + element))
      .reduce((value, element) => value + element);
}
