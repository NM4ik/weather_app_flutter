import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/api/data_sevice.dart';

class LoadData with ChangeNotifier {
  final _dataService = DataService();
  // dynamic? response;

  Future<dynamic> loadData(CityName) async {
    final response = await _dataService.getWeather(CityName);
    print(response);
    return response;
  }
}
