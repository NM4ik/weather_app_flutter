import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';
import 'package:weather_app_flutter/provider/settings_provider.dart';

import 'forecast_week_detail_card_widget.dart';

class ForecastWeekCardWidget extends StatefulWidget {
  const ForecastWeekCardWidget({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  _ForecastWeekCardWidgetState createState() => _ForecastWeekCardWidgetState();
}

class _ForecastWeekCardWidgetState extends State<ForecastWeekCardWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Theme.of(context).dialogBackgroundColor,
              Theme.of(context).highlightColor
            ],
            tileMode: TileMode.repeated,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Provider.of<InitialFunc>(context)
                      .sevenDays[widget.index]
                      .time
                      .toString(),
                  style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
                SvgPicture.asset(
                  'assets/images/partly_cloudy.svg',
                  width: 100,
                ),
                ForecastWeekDetailCard(
                  icon: "thermometer.svg",
                  value: context
                              .watch<SettingProvider>()
                              .settingMap["Температура"] ==
                          0
                      ? Provider.of<InitialFunc>(context)
                          .sevenDays[widget.index]
                          .current
                          .round()
                          .toString()
                      : (9 *
                                  (Provider.of<InitialFunc>(context)
                                      .sevenDays[widget.index]
                                      .current) /
                                  5 +
                              32)
                          .round()
                          .toString(),
                  typeOfValue: context
                              .watch<SettingProvider>()
                              .settingMap["Температура"] ==
                          0
                      ? '˚c'
                      : '˚F',
                ),
                ForecastWeekDetailCard(
                  icon: "wind_speed.svg",
                  value: context
                              .watch<SettingProvider>()
                              .settingMap["Сила ветра"] ==
                          0
                      ? (Provider.of<InitialFunc>(context)
                              .sevenDays[widget.index]
                              .wind_speed)
                          .round()
                          .toString()
                      : (3600 *
                              (Provider.of<InitialFunc>(context)
                                  .sevenDays[widget.index]
                                  .wind_speed) /
                              1000)
                          .round()
                          .toString(),
                  typeOfValue:
                      context.watch<SettingProvider>().settingMap["Сила ветра"] ==
                              0
                          ? 'м/c'
                          : 'км/ч',
                ),
                ForecastWeekDetailCard(
                  icon: "humidity.svg",
                  value: Provider.of<InitialFunc>(context).sevenDays[widget.index].humidity.round().toString(),
                  typeOfValue: '%',
                ),
                ForecastWeekDetailCard(
                  icon: "pressure.svg",
                  value:
                      context.watch<SettingProvider>().settingMap["Давление"] ==
                              0
                          ? (Provider.of<InitialFunc>(context)
                                      .sevenDays[widget.index]
                                      .pressure /
                                  1.3)
                              .round()
                              .toString() : Provider.of<InitialFunc>(context)
                          .sevenDays[widget.index]
                          .pressure
                          .round()
                          .toString(),
                  typeOfValue:
                      context.watch<SettingProvider>().settingMap["Давление"] ==
                              0
                          ? 'мм.рт.ст'
                          : 'гПа',
                ),
              ],
            ),
          ),
        ));
  }
}
