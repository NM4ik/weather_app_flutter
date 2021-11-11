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
      body: Container(
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
                      children: const [
                        SettingsCardPageWidget(title: 'Температура', unitMeasurementFirstValue: '˚C', unitMeasurementSecondValue: '˚F'),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7,), child: Divider(color: Colors.black, ),),
                        SettingsCardPageWidget(title: 'Сила ветра', unitMeasurementFirstValue: 'м/с', unitMeasurementSecondValue: 'км/ч'),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7,), child: Divider(color: Colors.black,),),
                        SettingsCardPageWidget(title: 'Давление', unitMeasurementFirstValue: 'мм.рт.ст.', unitMeasurementSecondValue: 'гПа'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
