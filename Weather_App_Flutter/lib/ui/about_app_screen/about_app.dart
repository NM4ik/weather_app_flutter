import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
        backgroundColor: Color(0xFFE2EBFF),
        appBar: AppBar(
          title: Text(
            "Настройки",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xFFE2EBFF),
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              ("assets/images/iconBack.svg"),
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
            heightFactor: 5,
            child: Neumorphic(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -15,
                  intensity: 0.7,
                  lightSource: LightSource.top,
                  color: Color(0xFFE2EBFF)
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 33),
                child: Text(
                  'Weather app',
                  style: GoogleFonts.manrope(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            )),
        bottomSheet: Container(
          color: Color(0xFFE2EBFF),
          height: height,
          child: Neumorphic(
            style: NeumorphicStyle(
                boxShape:
                NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                depth: 7,
                lightSource: LightSource.bottom,
                color: Color(0xFFE2EBFF)
            ),
            child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 23,),
                    Text('by NM4ik', style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.black
                    ),),
                    SizedBox(height: 8,),
                    Text('Версия 1.0', style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: Colors.black
                    ),),
                    SizedBox(height: 4,),
                    Text('от 30 сентября 2021', style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: Colors.black
                    ),),

                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('2021', style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            color: Colors.black
                        ),),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                )
            ),
          ),
        ));
  }
}
