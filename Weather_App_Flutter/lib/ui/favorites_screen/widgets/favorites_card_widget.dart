import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';

class FavoritesCardWidget extends StatelessWidget {
  const FavoritesCardWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Container(
        child: Neumorphic(
          style: NeumorphicStyle(
            color: Color(0xFFDEE9FF),
            depth: -5,
            lightSource: LightSource.top,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  // color: Colors.red,
                  child: Text(context.watch<SearchList>().favorites[index], style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black
                  ),),
                ),
                Container(
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      color: Color(0xFFC8DAFF),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        // print(Provider.of<SearchList>(context, listen: false).favorites[index]);
                        Provider.of<SearchList>(context, listen: false).popCityFromFavorites(Provider.of<SearchList>(context, listen: false).favorites[index].toString());
                      },
                      iconSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
