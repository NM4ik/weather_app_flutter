import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter/provider/settings_provider.dart';

class SettingsCardPageWidget extends StatefulWidget {
  final String title;
  final String unitMeasurementFirstValue;
  final String unitMeasurementSecondValue;

  const SettingsCardPageWidget({
    Key? key,
    required this.title,
    required this.unitMeasurementFirstValue,
    required this.unitMeasurementSecondValue,
  }) : super(key: key);

  @override
  State<SettingsCardPageWidget> createState() => _SettingsCardPageWidgetState();
}

class _SettingsCardPageWidgetState extends State<SettingsCardPageWidget> {
  var toggleIndex = 0;

  // toggleIndexes() {
  //   for(e in Provider.of<SettingProvider>(context).settingMap){
  //
  //   }
  // }

  get title => widget.title;
  get unit1 => widget.unitMeasurementFirstValue;
  get unit2 => widget.unitMeasurementSecondValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(0), //fix paddings
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: NeumorphicToggle(
                    style: NeumorphicToggleStyle(
                      disableDepth: true,
                      backgroundColor: const Color(0xffE2EBFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 160,
                    height: 35,
                    children: [
                      ToggleElement(
                          background: Center(
                            child: Text(
                              '$unit1',
                              style: GoogleFonts.manrope(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          foreground: Center(
                            child: Text(
                              '$unit1',
                              style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          )),
                      ToggleElement(
                        background: Center(
                          child: Text(
                            '$unit2',
                            style: GoogleFonts.manrope(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        foreground: Center(
                          child: Text(
                            '$unit2',
                            style: GoogleFonts.manrope(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ],
                    thumb: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff4B5F88),
                      ),
                    ),
                    selectedIndex: toggleIndexes(Provider.of<SettingProvider>(context).settingMap, title),
                    // selectedIndex: toggleIndex,
                    onChanged: (index) {
                      setState(() {
                        context.read<SettingProvider>().updateMap(widget.title, index);
                        Provider.of<SettingProvider>(context, listen: false).addSettingsSharedPref(widget.title, index);
                        toggleIndexes(Provider.of<SettingProvider>(context, listen: false).settingMap, title);
                        // print(index);
                        // toggleIndex = index;
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

int toggleIndexes(Map<String, int> map, String title) {
  for(var item in map.entries){
    if(item.key == title){
      return item.value;
    }
  }
  return 0;
}
