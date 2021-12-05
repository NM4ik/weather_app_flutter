import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/api/data_sevice.dart';
import 'package:weather_app_flutter/api/models.dart';
import 'package:weather_app_flutter/provider/settings_provider.dart';
import 'package:weather_app_flutter/ui/blocks/temperature_info.dart';

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

  List<Weather> todayWeather = [];
  DateTime date = DateTime.now();

  Future<Map<String, dynamic>> loadData(cityName) async {
    try {
      response = await _dataService.getWeather(cityName);
      Map<String, dynamic> response2 = await _oneCallApi.getOneCall(
          response.cord.cord[1].toString(), response.cord.cord[0].toString());

      todayWeather = hourly(response2);

      print(todayWeather);

      return response2;
    } catch (e) {
      print('Неверно указан город или не установлено соединение! Ошибка: $e');
      response = await _dataService.getWeather('Sankt-Peterburg');
      Map<String, dynamic> response2 = await _oneCallApi.getOneCall(
          response.cord.cord[1].toString(), response.cord.cord[0].toString());
      return response2;
    }
  }

  List<Weather> hourly(Map<String, dynamic> response2) {
    List<Weather> todayWeather = [];

    int hour = int.parse(DateFormat.H('ru').format(date)) + 3;

    for (var j = 0; j < 13; j += 3) {
      int i = hour + j;
      if (i > 23) {
        i = i - 24;
      }
      var hourly = Weather(
          image: response2['hourly'][i]["weather"][0]["main"],
          current: response2['hourly'][i]["temp"],
          time: Duration(hours: i).toString().split(":")[0] + ":00",
          humidity: response2['current']['humidity'],
          temp: response2['current']['temp'],
          pressure: response2['current']['pressure'],
          wind_speed: response2['current']['wind_speed'],
      );
      todayWeather.add(hourly);
    }
    return todayWeather;
  }
}

class Weather {
  final num current;
  final String image;
  final String time;
  final num temp;
  final num humidity;
  final num pressure;
  final num wind_speed;

  Weather({
    required this.image,
    required this.current,
    required this.time,
    required this.temp,
    required this.humidity,
    required this.pressure,
    required this.wind_speed,
  });
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
