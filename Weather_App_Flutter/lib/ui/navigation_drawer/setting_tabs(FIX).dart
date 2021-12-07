import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';
import 'package:weather_app_flutter/provider/settings_provider.dart';
import 'package:weather_app_flutter/ui/settings_screen/settings.dart';
import 'package:weather_app_flutter/ui/favorites_screen/favorites.dart';
import 'package:weather_app_flutter/ui/about_app_screen/about_app.dart';

buildMenuItem({required String text, required IconData icon, onClicked, context}) {
  final color = Theme.of(context).primaryColor;

  return ListTile(
    dense: true,
    leading: Icon(
      icon,
      color: color,
      size: 24,
    ),
    title: Align(
      child: Text(text,
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w500, fontSize: 20, color: color)),
      alignment: Alignment(-1.5, 0),
    ),
    // visualDensity: VisualDensity(horizontal: -4, vertical: -4),
    // dense: true,
    onTap: onClicked,
    contentPadding: EdgeInsets.only(left: 0, right: 0),
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SettingPage(),
      ));
      break;
    case 1:
      Provider.of<SearchList>(context, listen: false).initFavorites();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FavoritesPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AboutAppPage(),
      ));
      break;
  }
}
