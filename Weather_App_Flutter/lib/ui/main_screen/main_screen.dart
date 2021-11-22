import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app_flutter/api/data_sevice.dart';
import 'package:weather_app_flutter/api/models.dart';
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
  late WeatherResponse response;

  // final defaultCityName = 'Moscow';
  final defaultCityName = 'Sankt-Peterburg';

  final _dataService = DataService();

  Future<dynamic> _loadData() async {
    response = await _dataService.getWeather(defaultCityName);
    // setState(() {
    //   _response = response;
    // })
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Future.delayed(const Duration(seconds: 3)),
      future: _loadData(),
      // future: context.read<LoadData>().loadData(defaultCityName), // provider for new data(cities)
      // future: Provider.of<LoadData>(context, listen: false).loadData(defaultCityName),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Splash();
        } else {
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
                // SvgPicture.asset('assets/images/backgroundsvg.svg', fit: BoxFit.cover,),
                Container(
                  child: Stack(
                    children: [
                      MainAppBar(
                        response: response,
                      ),
                      SlidingUpPanelWidget(
                        panelController: panelController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}