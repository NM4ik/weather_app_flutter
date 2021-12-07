import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';
import 'package:weather_app_flutter/ui/favorites_screen/widgets/favorites_card_widget.dart';
import 'package:weather_app_flutter/ui/search_screen/search_entity.dart';
import 'package:weather_app_flutter/ui/settings_screen/widgets/settings_screen_card_widget.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Избранные",
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
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: context.watch<SearchList>().favorites.length,
          itemBuilder: (BuildContext context, int index) {
            return FavoritesCardWidget(index: index,);
          }),
    );
  }
}
