import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastWeekDetailCard extends StatelessWidget {
  const ForecastWeekDetailCard({Key? key, required this.icon, required this.value, required this.typeOfValue}) : super(key: key);
  final String icon;
  final String value;
  final String typeOfValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/$icon'),
          const SizedBox(width: 2,),
          Text(value, style: GoogleFonts.manrope(  //data quantity
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),),
          const SizedBox(width: 2,),
          Text(typeOfValue, style: GoogleFonts.manrope(  //signature for data
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF5A5A5A),
          ),),
        ],
      ),
    );
  }
}
