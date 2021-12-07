import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter/ui/blocks/temperature_info.dart';

class SettingProvider with ChangeNotifier {


  Map<String, int> settingMap = {
    "Температура" : 0,
    "Сила ветра": 0,
    "Давление": 0,
    "Тема": 0
  };

  void initSettings() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    settingMap["Температура"] = preferences.getInt("Температура")!;
    settingMap["Сила ветра"] = preferences.getInt("Сила ветра")!;
    settingMap["Давление"] = preferences.getInt("Давление")!;
    settingMap["Тема"] = preferences.getInt("Тема")!;
  }

  void updateMap(title, index) async{
    settingMap.forEach((key, value) {
      if(key == title){
        settingMap[key] = index;
      }
    });
    notifyListeners();
  }

  Future<void> addSettingsSharedPref(String title, int temp) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(title, temp);
    print(preferences.getInt(title));
    // preferences.setStringList('cities', cities);
  }
}



