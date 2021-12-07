import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, required this.response, required this.time, required this.image})
      : super(key: key);
  final String response;
  final String image;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: Theme.of(context).dialogBackgroundColor,
        depth: 5,
        intensity: 0.4,
        lightSource: LightSource.topLeft,
      ),
      child: Container(
        width: 65,
        height: 122,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: GoogleFonts.manrope(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
              SvgPicture.asset(
                ("assets/images/$image.svg"),
                width: 40,
              ),
              Text(
                response,
                style: GoogleFonts.manrope(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
