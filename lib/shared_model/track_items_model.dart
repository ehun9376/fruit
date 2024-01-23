import 'package:flutter/material.dart';
import 'package:fruit/model/item.dart';

class TrackItemsModol extends ChangeNotifier {
  List<ItemModel> _trackItems = [];

  List<ItemModel> get trackItems => _trackItems;
  set trackItems(List<ItemModel> newValue) {
    _trackItems = newValue;
    notifyListeners();
  }

  void addTrackItem(ItemModel trackItem) {
    List<ItemModel> tempList = List.from(trackItems);
    tempList.add(trackItem);
    trackItems = tempList;
  }

  void removeTrackItem(ItemModel trackItem) {
    List<ItemModel> tempList = List.from(trackItems);
    tempList.remove(trackItem);
    trackItems = tempList;
  }

  bool isTrackItem(ItemModel trackItem) {
    return trackItems.map((e) => e.itemID).contains(trackItem.itemID);
  }

  //historyItems
  List<ItemModel> _historyItems = [];

  List<ItemModel> get historyItems => _historyItems;

//TODO: - TrackAPI
}
