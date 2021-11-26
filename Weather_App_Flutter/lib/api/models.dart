class WeatherResponse{
  final coordinatesInfo cord;
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  WeatherResponse({required this.cityName, required this.tempInfo, required this.weatherInfo, required this.cord});

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    final cityName = json['name'];

    final cordJson = json['coord'];
    final cordInfo = coordinatesInfo.fromJson(cordJson);

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo, cord: cordInfo);
  }
}
class coordinatesInfo{
  final cord;

  coordinatesInfo({required this.cord});

  factory coordinatesInfo.fromJson(Map<String, dynamic> json){
    final cord1 = json['lon'];
    final cord2 = json['lat'];
    final cord = [cord1, cord2];
    return coordinatesInfo(cord: cord);
  }
}

class TemperatureInfo{
  final double temperature;

  TemperatureInfo({required this.temperature});
  factory TemperatureInfo.fromJson(Map<String, dynamic> json){
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherInfo{
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});
  factory WeatherInfo.fromJson(Map<String, dynamic> json){
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}
