import 'package:flutter/material.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/widgets/weather_detail_card_widget.dart';

class DetailWeatherElements extends StatelessWidget {
  const DetailWeatherElements({Key? key, required this.response}) : super(key: key);
  final Map response;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      curve: Curves.bounceInOut,
      child: Padding(
        padding: const EdgeInsets.only(top: 32), //отредактировать паддинги
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherDetailCard(response: response['current']['temp'].round().toString(), type: 'C', iconName: 'thermometer.svg',),
                SizedBox(width: 20,),
                WeatherDetailCard(response: response['current']['humidity'].round().toString(), type: '%', iconName: 'humidity.svg'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherDetailCard(response: (response['current']['wind_speed'] * 0.514).round().toString(), type: 'м/c', iconName: 'wind_speed.svg'),
                  // SizedBox(width: 20,),
                  WeatherDetailCard(response: response['current']['pressure'].round().toString(), type: 'мм.рт.ст', iconName: 'pressure.svg'),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
