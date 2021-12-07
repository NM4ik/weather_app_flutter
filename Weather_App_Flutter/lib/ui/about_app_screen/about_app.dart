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
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Настройки",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              ("assets/images/iconBack.svg"),
              color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).dialogBackgroundColor
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 33),
                child: Text(
                  'Weather app',
                  style: GoogleFonts.manrope(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )),
        bottomSheet: Container(
          color: Theme.of(context).dialogBackgroundColor,
          height: height,
          child: Neumorphic(
            style: NeumorphicStyle(
                boxShape:
                // NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                NeumorphicBoxShape.roundRect(BorderRadius.vertical(top: Radius.circular(30))),

                depth: 7,
                lightSource: LightSource.bottom,
                color: Theme.of(context).dialogBackgroundColor
            ),
            child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 23,),
                    Text('by NM4ik', style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Theme.of(context).primaryColor
                    ),),
                    SizedBox(height: 8,),
                    Text('Версия 1.0', style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: Theme.of(context).primaryColor
                    ),),
                    SizedBox(height: 4,),
                    Text('от 30 сентября 2021', style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: Theme.of(context).primaryColor
                    ),),

                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('2021', style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            color: Theme.of(context).primaryColor
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
