import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/provider/data_provider.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';
import 'package:weather_app_flutter/provider/settings_provider.dart';
import 'package:weather_app_flutter/ui/main_screen/main_screen.dart';
import 'package:weather_app_flutter/provider/is_visible_provider.dart';

void main() {
  initializeDateFormatting('ru', null);
  runApp(
    // const MyApp()
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => isVisibleProvider()),
        ChangeNotifierProvider(create: (_) => LoadData()),
        ChangeNotifierProvider(create: (_) => SearchList()),
        ChangeNotifierProvider(create: (_) => InitialFunc()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of application.(* ￣︿￣)
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Main(),
    );
  }
}
