import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app_flutter/api/data_sevice.dart';
import 'package:weather_app_flutter/api/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';
import 'package:weather_app_flutter/ui/splash/splash-loader.dart';
import 'package:weather_app_flutter/ui/main_screen/widgets/app_bar_controller.dart';
import 'package:weather_app_flutter/ui/navigation_drawer/navigation_drawer.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/sliding_up_panel.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final panelController = PanelController();
  late bool isVisible;
  late final String sharedCity;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      // future: Provider.of<InitialFunc>(context).loadData(sharedCity = prefs.),
      future: Provider.of<InitialFunc>(context).loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            drawer: Container(width: 260, child: NavigationDrawerWidget()),
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Stack(
                    children: [
                      MainAppBar(
                        response: Provider.of<InitialFunc>(context).response,
                      ),
                      SlidingUpPanelWidget(
                        // response: snapshot.data!,
                        response: Provider.of<InitialFunc>(context).todayWeather,
                        panelController: panelController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Splash();
        }
      },
    );
  }
}



