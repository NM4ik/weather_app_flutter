import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2EBFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Weather',
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 35,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 125.0),
            child: SpinKitRing(
              color: Colors.black,
              size: 50.0,
            ),
          )
        ],
      ),
    );
  }
}