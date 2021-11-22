import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/ui/favorites_screen/widgets/favorites_card_widget.dart';
import 'package:weather_app_flutter/ui/settings_screen/widgets/settings_screen_card_widget.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFFE2EBFF),
        appBar: AppBar(
          title: Text(
            "Избранные",
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
        body: Column(
          children: [
            FavoritesCardWidget(),

          ],
        ));
  }
}
