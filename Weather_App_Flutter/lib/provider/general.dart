import 'package:flutter/material.dart';

class SearchList with ChangeNotifier {
  List<String> citises = [];

  void addCityToHistory(cityName) {
    if (citises.isNotEmpty) {
      for (int i = 0; i < citises.length; i++) {
        if (cityName == citises[i]) {
          return;
        } else {
          citises.add(cityName);
        }
      }
    } else {
      citises.add(cityName);
    }
    notifyListeners();
  }
}
