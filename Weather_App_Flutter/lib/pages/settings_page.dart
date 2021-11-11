import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/widgets/settings_page_widgets/settings_page_card_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Color(0xFFE2EBFF),
      appBar: AppBar(
<<<<<<< HEAD
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
=======
        title: Text("Настройки", style: GoogleFonts.manrope(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black,
        ),),
        backgroundColor: Color(0xFFE2EBFF),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(("assets/images/iconBack.svg"), color: Colors.black,),
>>>>>>> 248b8163c38b80a8b74145754062eaaf9c38dd21
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
<<<<<<< HEAD
          color: Color(0xFFE2EBFF),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 16),
                  child: Text(
                    "Единицы измерения",
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF828282),
                    ),
                  ),
                ),
                Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 3,
                    lightSource: LightSource.top,
                    color: Color(0xFFE2EBFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
                    child: Column(
                      children: [
                        SettingsCardPageWidget(),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7,), child: Divider(color: Colors.black, ),),
                        SettingsCardPageWidget(),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7,), child: Divider(color: Colors.black,),),
                        SettingsCardPageWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
=======
        color: Color(0xFFE2EBFF),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 16),
                child: Text("Единицы измерения", style: GoogleFonts.manrope(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF828282),
                ),),
              ),
              SettingsCardPageWidget(),
            ],
          ),
        )
      ),
>>>>>>> 248b8163c38b80a8b74145754062eaaf9c38dd21
    );
  }
}
