import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/provider/is_visible_sliding_up_widget.dart';
import 'package:provider/provider.dart';

class Degreess extends StatelessWidget {
  const Degreess({Key? key}) : super(key: key);


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
                  Text('Санкт-Петербург', style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('10˚c', style: GoogleFonts.manrope(
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
                Text('10˚c', style: GoogleFonts.manrope(
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -10,
                ),),
                Text("23 сент. 2021", style: GoogleFonts.manrope(
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
