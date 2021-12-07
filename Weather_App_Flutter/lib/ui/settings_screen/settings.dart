import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/ui/settings_screen/widgets/settings_screen_card_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Container(
          color: Theme.of(context).dialogBackgroundColor,
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
                      color: Theme.of(context).primaryColor,
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
                    color: Theme.of(context).dialogBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
                    child: Column(
                      children: const [
                        SettingsCardPageWidget(title: 'Температура', unitMeasurementFirstValue: '˚C', unitMeasurementSecondValue: '˚F'),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7,), child: Divider(color: Colors.black, ),),
                        SettingsCardPageWidget(title: 'Сила ветра', unitMeasurementFirstValue: 'м/с', unitMeasurementSecondValue: 'км/ч'),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7,), child: Divider(color: Colors.black,),),
                        SettingsCardPageWidget(title: 'Давление', unitMeasurementFirstValue: 'мм.рт.ст.', unitMeasurementSecondValue: 'гПа'),                        Padding(padding: EdgeInsets.symmetric(vertical: 7,), child: Divider(color: Colors.black,),),
                        SettingsCardPageWidget(title: 'Тема', unitMeasurementFirstValue: 'Светлая', unitMeasurementSecondValue: 'Темная'),
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
