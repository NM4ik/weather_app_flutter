import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/ui/navigation_drawer/setting_tabs(FIX).dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: SafeArea(
            child: Material(
              color: Theme.of(context).dialogBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("WeatherApp",
                    style: GoogleFonts.manrope(
                      color: Theme.of(context).primaryColor,
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
                            context: context,
                          ),
                          SizedBox(height: 10,),
                          buildMenuItem(
                            text: 'Избранные',
                            icon: Icons.favorite_border,
                            onClicked: () => selectedItem(context, 1),
                            context: context,
                          ),
                          SizedBox(height: 10,),
                          buildMenuItem(
                            text: 'О приложении',
                            icon: Icons.account_circle_outlined,
                            onClicked: () => selectedItem(context, 2),
                            context: context,
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


