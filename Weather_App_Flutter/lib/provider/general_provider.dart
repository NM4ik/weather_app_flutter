import 'package:flutter/material.dart';
import 'package:weather_app_flutter/api/data_sevice.dart';
import 'package:weather_app_flutter/api/models.dart';

class InitialFunc with ChangeNotifier {
  late WeatherResponse response;

  String defaultCityName = 'Sankt-Peterburg';

  void setCity(String city) {
    print(city);
    defaultCityName = city;
    notifyListeners();
  }

  final _dataService = DataService();
  final _oneCallApi = OneCallApi();

  Future<Map<String, dynamic>> loadData(cityName) async {
    try {
      response = await _dataService.getWeather(cityName);
      Map<String, dynamic> response2 = await _oneCallApi.getOneCall(
          response.cord.cord[1].toString(), response.cord.cord[0].toString());
      return response2;
    } catch (e) {
      print('Неверно указан город или не установлено соединение');
      response = await _dataService.getWeather('Sankt-Peterburg');
      Map<String, dynamic> response2 = await _oneCallApi.getOneCall(
          response.cord.cord[1].toString(), response.cord.cord[0].toString());
      return response2;
    }
  }
}

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

class City {
  final String name;
  final bool toggle;

  City({required this.name, required this.toggle});
}
