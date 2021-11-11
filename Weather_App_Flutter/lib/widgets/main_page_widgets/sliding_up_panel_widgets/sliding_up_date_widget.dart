import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidingUpDateWidget extends StatelessWidget {
  const SlidingUpDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: AnimatedSwitcher(
        reverseDuration: Duration(milliseconds: 500),
        duration: Duration(milliseconds: 2000),
        child: Text("23 сентября" , style: GoogleFonts.manrope(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black
        ),),
      ),
=======
    return AnimatedSwitcher(
      reverseDuration: Duration(milliseconds: 500),
      duration: Duration(milliseconds: 2000),
      child: Text("23 сентября" , style: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.black
      ),),
>>>>>>> 248b8163c38b80a8b74145754062eaaf9c38dd21
    );
  }
}
