import 'package:flutter/material.dart';
import 'package:weather_app_flutter/api/models.dart';
import 'package:weather_app_flutter/ui/main_screen/widgets/temperature_info_widget.dart';
import 'navigation_button_widget.dart';
import 'temperature_info_widget.dart';
import 'add_button_widget.dart';

class MainAppBar extends StatelessWidget {
  MainAppBar({Key? key, required this.response}) : super(key: key);
  WeatherResponse response;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Column(
          children: [
            Row( //header
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavButton(),
                Degreess(response: response,),
                AddButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
