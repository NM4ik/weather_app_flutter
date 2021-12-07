import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/api/data_sevice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter/api/models.dart';
import 'package:weather_app_flutter/provider/settings_provider.dart';
import 'package:weather_app_flutter/ui/blocks/temperature_info.dart';

class InitialFunc with ChangeNotifier {
  late WeatherResponse response;
  late String defaultCityName;
  // String defaultCityName = 'Sankt-Peterburg';


  setCity(String city) async{
    print(city);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('city', city);
    // defaultCityName = city;
    notifyListeners();
  }

  final _dataService = DataService();
  final _oneCallApi = OneCallApi();

  List<Weather> todayWeather = [];
  List<Weather> sevenDays = [];
  DateTime date = DateTime.now();

  Future<String> getCityFromSharedPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final city = preferences.getString('city');
    if(city == null){
      return 'Sankt-Peterburg';
    }
    return city;
  }

  Future<Map<String, dynamic>> loadData() async {
    try {
      response = await _dataService.getWeather(await getCityFromSharedPref());
      Map<String, dynamic> response2 = await _oneCallApi.getOneCall(
          response.cord.cord[1].toString(), response.cord.cord[0].toString());
      todayWeather = hourly(response2);
      sevenDays = sevenDaysFunc(response2);
      return response2;
    } catch (e) {
      print('Неверно указан город или не установлено соединение! Ошибка: $e');
      response = await _dataService.getWeather('Sankt-Peterburg');
      Map<String, dynamic> response2 = await _oneCallApi.getOneCall(
          response.cord.cord[1].toString(), response.cord.cord[0].toString());
      return response2;
    }
  }

  List<Weather> sevenDaysFunc(Map<String, dynamic> response2) {
    List<Weather> sevenDays = [];

    for (var i = 0; i < 8; i++) {
      DateTime _date = DateTime.now();
      _date = _date.add(Duration(days: i));
      String day = DateFormat.MMMMd('ru').format(_date);

      var daily = Weather(image: response2["daily"][i]["main"].toString(),
          current: response2["daily"][i]["temp"]["day"],
          time: day,
          temp: response2['current']['temp'],
          humidity: response2["daily"][i]["humidity"],
          pressure: response2["daily"][i]["pressure"],
          wind_speed: response2["daily"][i]["wind_speed"]
      );

      sevenDays.add(daily);
    }
    return sevenDays;
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


Future<List<String>> getCitiesSharedPref() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final cities = preferences.getStringList('cities');
  if(cities == null){
    return [];
  }
  return cities;
}

Future<List<String>> getFavSharedPref() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final favorites = preferences.getStringList('favorites');
  if(favorites == null){
    return [];
  }
  return favorites;
}

Future<void> addCitiesSharedPref(List<String> cities) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setStringList('cities', cities);
}

Future<void> addFavoriteSharedPref(List<String> favorites) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setStringList('favorites', favorites);
}

class SearchList with ChangeNotifier{
  List<String> citises = [];
  List<String> favorites = [];

  void initCities() async{
    citises = await getCitiesSharedPref();
  }
  void initFavorites() async{
    favorites = await getFavSharedPref();
  }

  void addCityToHistory(cityName) async{
    int quantity = 0;
    for (int i = 0; i < citises.length; i++) {
      if (citises[i] == cityName) {
        quantity++;
      }
    }
    if (quantity == 0) {
      citises.add(cityName);
    }


    await addCitiesSharedPref(citises);
    notifyListeners();
  }

  void addCityToFavorite(cityName) async{
    int quantity = 0;
    for (int i = 0; i < favorites.length; i++) {
      if (favorites[i] == cityName) {
        quantity++;
      }
    }
    if (quantity == 0) {
      favorites.add(cityName);
    }

    await addFavoriteSharedPref(favorites);
    notifyListeners();
    // print(favorites);
  }

  void popCityFromFavorites(cityName) async{
    for (int i = 0; i < favorites.length; i++) {
      if (favorites[i] == cityName) {
        favorites.remove(favorites[i]);
      }
    }

    await addFavoriteSharedPref(favorites);
    notifyListeners();
  }

  bool searchingForEmpty(cityName) {
    for (int i = 0; i < favorites.length; i++) {
      if (favorites[i] == cityName) {
        return true;
      }
    }
    return false;
  }
}
