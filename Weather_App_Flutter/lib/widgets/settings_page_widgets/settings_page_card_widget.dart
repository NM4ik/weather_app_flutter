import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsCardPageWidget extends StatefulWidget {
  const SettingsCardPageWidget({Key? key}) : super(key: key);

  @override
  State<SettingsCardPageWidget> createState() => _SettingsCardPageWidgetState();
}

class _SettingsCardPageWidgetState extends State<SettingsCardPageWidget> {
  var toggleIndex = 0;

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
                  Text("Температура", style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),),
                  Neumorphic(
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
                                'м/с',
                                style: GoogleFonts.manrope(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            foreground: Center(
                              child: Text(
                                'м/с',
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
                              'км/ч',
                              style: GoogleFonts.manrope(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          foreground: Center(
                            child: Text(
                              'км/ч',
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
                      selectedIndex: toggleIndex,
                      onChanged: (index) {
                        setState(() {
                          toggleIndex = index;
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
