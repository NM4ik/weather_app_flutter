import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app_flutter/pages/settings_page.dart';
import 'package:weather_app_flutter/widgets/main_page_widgets/sliding_up_panel_widgets/sliding_up_panel_widget.dart';
import '../widgets/main_page_widgets/app_bar_widgets/main_page_app_bar_widget.dart';
import '../widgets/main_page_widgets/drawer_widgets/navigation_drawer_widget.dart';
import 'package:weather_app_flutter/provider/is_visible_sliding_up_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // const MyApp()
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => isVisibleProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.(* ￣︿￣)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      // home: const Main(),
      initialRoute: '/', //debug
      routes: {
        '/': (context) => Main(),
        '/settings': (context) => SettingPage(),
      },
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final panelController = PanelController();
  late bool isVisible;

  @override
  Widget build(BuildContext context) {
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
                MainAppBar(),
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
}
