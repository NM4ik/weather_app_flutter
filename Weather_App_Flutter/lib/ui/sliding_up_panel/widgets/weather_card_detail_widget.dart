import 'package:flutter/material.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/widgets/weather_detail_card_widget.dart';

class DetailWeatherElements extends StatelessWidget {
  const DetailWeatherElements({Key? key}) : super(key: key);

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
                WeatherDetailCard(),
                SizedBox(width: 20,),
                WeatherDetailCard(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherDetailCard(),
                  SizedBox(width: 20,),
                  WeatherDetailCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
