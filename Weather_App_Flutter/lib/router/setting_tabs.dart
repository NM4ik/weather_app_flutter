import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/pages/settings_page.dart';
import 'package:weather_app_flutter/pages/favorites_page.dart';
import 'package:weather_app_flutter/pages/profile_page.dart';



buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked}) {
  final color = Colors.black;

  return ListTile(
    dense: true,
    leading: Icon(icon, color: color, size: 24,),
    title: Align(child: Text(text, style: GoogleFonts.manrope(fontWeight: FontWeight.w500, fontSize: 20, color: color)), alignment: Alignment(-1.5, 0),),
    // visualDensity: VisualDensity(horizontal: -4, vertical: -4),
    // dense: true,
    onTap: onClicked,
    contentPadding: EdgeInsets.only(left: 0, right: 0),
  );
}

void selectedItem(BuildContext context, int index){
  Navigator.of(context).pop();
  
  switch(index){
    case 0:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingPage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoritesPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage(),
      ));
      break;
  }
}


