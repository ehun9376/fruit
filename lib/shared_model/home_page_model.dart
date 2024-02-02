import 'package:flutter/material.dart';
import 'package:fruit/api_service/api_service.dart';
import 'package:fruit/model/ad_model.dart';

class HomePageModel extends ChangeNotifier {
  AdListModel? _adListModel;
  AdListModel? get adListModel => _adListModel;
  set adListModel(AdListModel? newValue) {
    adListModel = newValue;
    notifyListeners();
  }

  void getAdListModel() {
    ApiService.getAdList().then((value) {
      adListModel = value.model;
    });
  }
}
