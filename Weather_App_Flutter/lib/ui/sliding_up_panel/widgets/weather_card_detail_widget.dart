import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';
import 'package:weather_app_flutter/provider/settings_provider.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/widgets/weather_detail_card_widget.dart';

class DetailWeatherElements extends StatelessWidget {
  const DetailWeatherElements({Key? key, required this.response})
      : super(key: key);
  final List<Weather> response;

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
                WeatherDetailCard(
                  response: context
                              .watch<SettingProvider>()
                              .settingMap["Температура"] ==
                          0
                      ? response[1].current.round().toString()
                      : '${(9 * (response[1].current) / 5 + 32).round()}',
                  type: context
                              .watch<SettingProvider>()
                              .settingMap["Температура"] ==
                          0
                      ? '˚c'
                      : '˚F',
                  iconName: 'thermometer.svg',
                ),
                const SizedBox(
                  width: 20,
                ),
                WeatherDetailCard(
                    response: response[0].humidity.round().toString(),
                    type: '%',
                    iconName: 'humidity.svg'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherDetailCard(
                      response:
                      context
                          .watch<SettingProvider>()
                          .settingMap["Сила ветра"] ==
                          0 ? (response[0].wind_speed).round().toString() : (3600*(response[0].wind_speed)/1000).round().toString(),
                      type: context
                          .watch<SettingProvider>()
                          .settingMap["Сила ветра"] == 0 ? 'м/c' : 'км/ч',
                      iconName: 'wind_speed.svg'),
                  // SizedBox(width: 20,),
                  WeatherDetailCard(
                      response: context
                          .watch<SettingProvider>()
                          .settingMap["Давление"] ==
                          0 ? response[0].pressure.round().toString() : (response[0].pressure * 1.3).round().toString(),
                      type: context
                          .watch<SettingProvider>()
                          .settingMap["Давление"] == 0 ? 'мм.рт.ст' : 'гПа',
                      iconName: 'pressure.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
