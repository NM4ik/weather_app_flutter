import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class WeatherDetailCard extends StatelessWidget {
  const WeatherDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Neumorphic(
        style: NeumorphicStyle(
          color: Color(0xFFE0E9FD),
          depth: 5,
          intensity: 0.4,
          lightSource: LightSource.topLeft,
        ),
        child: Container(
          // width: 170,
          // height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(("assets/images/thermometer.svg"),),
                Text("8", style: GoogleFonts.manrope(  //data quantity
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),),

                Text("˚c", style: GoogleFonts.manrope(  //signature for data
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5A5A5A),
                ),),
              ],
            ),
          ),
        )
      ),
    );
  }
}
