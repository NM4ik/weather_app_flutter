import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/router/setting_tabs.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: SafeArea(
            child: Material(
              color: Color(0xFFE2EBFF),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("WeatherApp",
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          buildMenuItem(
                            text: 'Настройки',
                            icon: Icons.settings_outlined,
                            onClicked: () => selectedItem(context, 0),
                          ),
                          SizedBox(height: 10,),
                          buildMenuItem(
                            text: 'Избранное',
                            icon: Icons.favorite_border,
                            onClicked: () => selectedItem(context, 1),
                          ),
                          SizedBox(height: 10,),
                          buildMenuItem(
                            text: 'Профиль',
                            icon: Icons.account_circle_outlined,
                            onClicked: () => selectedItem(context, 2),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      );

}


