import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/api/models.dart';
import 'package:weather_app_flutter/provider/is_visible_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Degreess extends StatelessWidget {
  Degreess({Key? key, required this.response}) : super(key: key);
  WeatherResponse response;



  // DateTime now = DateTime.now();
  // String dateNow = DateFormat('yMMMd – kk:mm', 'Ru').format(DateTime.now());
  String dateNow = DateFormat('yMMMd', 'ru').format(DateTime.now());


  // ${context.watch<isVisibleProvider>().isVisible}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          context.watch<isVisibleProvider>().isVisible ? Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Text(response.cityName, style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('${response.tempInfo.temperature}', style: GoogleFonts.manrope(
                      fontSize: 80,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -10,
                    ),),
                  ),
                ],
              ),
            ),
          ) : Container(
            child: Column(
              children: [
                Text('${response.tempInfo.temperature}', style: GoogleFonts.manrope(
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -10,
                ),),
                Text(dateNow, style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
