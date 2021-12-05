import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/ui/blocks/temperature_info.dart';

class SettingProvider with ChangeNotifier {

  Map<String, int> settingMap = {
    "Температура" : 0,
    "Сила ветра": 0,
    "Давление": 0
  };

  void updateMap(title, index){
    settingMap.forEach((key, value) {
      if(key == title){
        settingMap[key] = index;
      }
    });
    notifyListeners();
  }
}
