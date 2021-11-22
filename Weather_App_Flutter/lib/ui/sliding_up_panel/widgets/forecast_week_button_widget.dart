import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/ui/forecast_week_screen/forecast_week.dart';


class FullWeekButton extends StatelessWidget {
  const FullWeekButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: RaisedButton(
        color: Color(0xFFE2EBFF),
        textColor: Color(0xFF038CFE),
        shape: StadiumBorder(
          side: BorderSide(color: Color(0xFF038CFE), width: 1),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForecastWeek()));
        },
        child: Text('Прогноз на неделю', style: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),),
      ),
    );
  }
}
