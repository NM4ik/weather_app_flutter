import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingProvider with ChangeNotifier {
  Map<String, int> settingMap = {
    "Температура" : 1,
    "Сила ветра": 0,
    "Давление": 0
  };

  void updateMap(title, index){
    settingMap.forEach((key, value) {
      if(key == title){
        settingMap[key] = index;
      }
    });
  }

  // void updateMap(){
  //   print(settingMap.values);
  //   settingMap.forEach((key, value) {
  //     if(key == "Температура"){
  //       settingMap[key] = 10;
  //     }
  //   });
  // }
}
