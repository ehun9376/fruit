import 'package:flutter/material.dart';
import 'package:fruit/model/item.dart';

class CartItemsModel extends ChangeNotifier {
  Map<String, List<ItemModel>> _cartItems = {};

  Map<String, List<ItemModel>> get cartItems => _cartItems;
  set cartItems(Map<String, List<ItemModel>> value) {
    _cartItems = value;
    notifyListeners();
  }

  void addCartItem(ItemModel cartItem) {
    Map<String, List<ItemModel>> tempMap = Map.from(cartItems);

    var targetStore = tempMap[cartItem.storeID ?? ""];

    if (targetStore == null) {
      tempMap[cartItem.storeID ?? ""] = [cartItem];
    } else {
      ItemModel targetItem = targetStore.firstWhere(
        (element) => element.itemID == cartItem.itemID,
        orElse: () => ItemModel(),
      );

      if (targetItem.itemID == cartItem.itemID) {
        targetItem.quantity += 1;
      } else {
        targetStore.add(cartItem);
      }
    }

    cartItems = tempMap;
    totalPrice = getTotalItemsPrice();
    notifyListeners();
  }

  void removeCartItem(ItemModel cartItem) {
    Map<String, List<ItemModel>> tempMap = Map.from(cartItems);

    var targetStore = tempMap[cartItem.storeID ?? ""];

    if (targetStore == null) {
      return;
    } else {
      ItemModel targetItem = targetStore.firstWhere(
        (element) => element.itemID == cartItem.itemID,
        orElse: () => ItemModel(),
      );

      if (targetItem.itemID == cartItem.itemID) {
        targetItem.quantity -= 1;

        if (targetItem.quantity == 0) {
          targetStore.remove(targetItem);
        }

        if (targetStore.isEmpty) {
          tempMap.remove(cartItem.storeID ?? "");
        }
      }
    }

    cartItems = tempMap;
    totalPrice = getTotalItemsPrice();
    notifyListeners();
  }

  void clearCartItems() {
    cartItems = {};

    notifyListeners();
  }

  void selectAllForStore(String storeID) {
    Map<String, List<ItemModel>> tempMap = Map.from(cartItems);

    var targetStore = tempMap[storeID];

    if (targetStore == null) {
      return;
    } else {
      for (var element in targetStore) {
        element.isSelected = true;
      }
    }

    cartItems = tempMap;
    totalPrice = getTotalItemsPrice();
    notifyListeners();
  }

  void unSelectAllForStore(String storeID) {
    Map<String, List<ItemModel>> tempMap = Map.from(cartItems);

    var targetStore = tempMap[storeID];

    if (targetStore == null) {
      return;
    } else {
      for (var element in targetStore) {
        element.isSelected = false;
      }
    }

    cartItems = tempMap;
    totalPrice = getTotalItemsPrice();
    notifyListeners();
  }

  void selectForItem(String itemID) {
    Map<String, List<ItemModel>> tempMap = Map.from(cartItems);

    for (var element in tempMap.values) {
      ItemModel targetItem = element.firstWhere(
        (element) => element.itemID == itemID,
        orElse: () => ItemModel(),
      );

      if (targetItem.itemID == itemID) {
        targetItem.isSelected = true;
      }
    }

    cartItems = tempMap;
    totalPrice = getTotalItemsPrice();
    notifyListeners();
  }

  void unSelectForItem(String itemID) {
    Map<String, List<ItemModel>> tempMap = Map.from(cartItems);

    for (var element in tempMap.values) {
      ItemModel targetItem = element.firstWhere(
        (element) => element.itemID == itemID,
        orElse: () => ItemModel(),
      );

      if (targetItem.itemID == itemID) {
        targetItem.isSelected = false;
      }
    }

    cartItems = tempMap;
    totalPrice = getTotalItemsPrice();
    notifyListeners();
  }

  int getTotalItemsPrice() {
    int totalPrice = 0;

    cartItems.forEach((key, value) {
      for (var element in value) {
        if (element.isSelected) {
          totalPrice += ((element.price ?? 0) * element.quantity);
          debugPrint("totalPrice: $totalPrice");
        }
      }
    });

    return totalPrice;
  }

  int _totalPrice = 0;

  int get totalPrice => _totalPrice;
  set totalPrice(int value) {
    _totalPrice = value;
    notifyListeners();
  }
}
