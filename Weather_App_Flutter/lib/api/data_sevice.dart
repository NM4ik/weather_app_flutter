import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app_flutter/api/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '8b0e60ec97b1abd6e99ea1ca19e464bd',
      'units': 'imperial',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}

class OneCallApi {
  Future<Map> getOneCall(double lat, double lon) async {
    final response  = await get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,current,alerts&appid=8b0e60ec97b1abd6e99ea1ca19e464bd'));
    final json = jsonDecode(response.body);
    return json;
  }
}
