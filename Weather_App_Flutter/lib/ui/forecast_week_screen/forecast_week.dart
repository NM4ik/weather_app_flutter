import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/ui/forecast_week_screen/widgets/forecast_week_card_widget.dart';
import 'package:weather_app_flutter/ui/forecast_week_screen/widgets/forecast_week_detail_card_widget.dart';
import 'package:weather_app_flutter/ui/forecast_week_screen/widgets/forecast_week_button_widget.dart';

class ForecastWeek extends StatefulWidget {
  const ForecastWeek({Key? key}) : super(key: key);

  @override
  _ForecastWeekState createState() => _ForecastWeekState();
}

class _ForecastWeekState extends State<ForecastWeek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2EBFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 34),
                child: Text(
                  'Прогноз на неделю',
                  style: GoogleFonts.manrope(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 380,
                child: Swiper(
                  curve: Curves.easeIn,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return ForecastWeekCardWidget(index: index);
                  },
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              FarecastWeekButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
