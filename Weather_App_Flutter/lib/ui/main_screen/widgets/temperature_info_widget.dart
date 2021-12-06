import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/api/models.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';
import 'package:weather_app_flutter/provider/is_visible_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/provider/settings_provider.dart';
import 'package:weather_app_flutter/ui/blocks/temperature_info.dart';

class Degreess extends StatefulWidget {
  Degreess({Key? key, required this.response}) : super(key: key);
  WeatherResponse response;

  @override
  State<Degreess> createState() => _DegreessState();
}

class _DegreessState extends State<Degreess> {
  String dateNow = DateFormat('yMMMd', 'ru').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          context.watch<isVisibleProvider>().isVisible
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Text(
                          widget.response.cityName,
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            context
                                        .watch<SettingProvider>()
                                        .settingMap["Температура"] ==
                                    0
                                ? '${widget.response.tempInfo.temperature.round()} ˚c'
                                : '${(9 * (widget.response.tempInfo.temperature) / 5 + 32).round()} ˚F',
                            style: GoogleFonts.manrope(
                              fontSize: 80,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  child: Column(
                    children: [
                      Text(
                        context
                                    .watch<SettingProvider>()
                                    .settingMap["Температура"] ==
                                0
                            ? '${widget.response.tempInfo.temperature.round()} ˚c'
                            : '${(9 * (widget.response.tempInfo.temperature) / 5 + 32).round()} ˚F',
                        style: GoogleFonts.manrope(
                          fontSize: 80,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -7,
                        ),
                      ),
                      Text(
                        dateNow,
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
