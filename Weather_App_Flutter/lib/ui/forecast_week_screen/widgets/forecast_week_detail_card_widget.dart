import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastWeekDetailCard extends StatelessWidget {
  const ForecastWeekDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
