import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';

class FavoritesCardWidget extends StatefulWidget {
  const FavoritesCardWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<FavoritesCardWidget> createState() => _FavoritesCardWidgetState();
}

class _FavoritesCardWidgetState extends State<FavoritesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Container(
        child: Neumorphic(
          style: NeumorphicStyle(
            color: Theme.of(context).dialogBackgroundColor,
            depth: -5,
            lightSource: LightSource.top,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    // color: Colors.red,
                    child: Text(context.watch<SearchList>().favorites[widget.index].toString(), style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Theme.of(context).primaryColor
                    ),),
                  ),
                  onTap: () {
                    _search(Provider.of<SearchList>(context, listen: false).favorites[widget.index].toString());
                    Future.delayed(Duration(milliseconds: 800), () {
                      Navigator.pop(context);
                    });
                    // _search(context.watch<SearchList>().favorites[widget.index].toString());
                  },
                ),
                Container(
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      color: Theme.of(context).highlightColor,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.close, color: Theme.of(context).primaryColor),
                      onPressed: () {
                        // print(Provider.of<SearchList>(context, listen: false).favorites[index]);
                        Provider.of<SearchList>(context, listen: false).popCityFromFavorites(Provider.of<SearchList>(context, listen: false).favorites[widget.index].toString());
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
  void _search(String text) {
    String cityName = text;
    Provider.of<InitialFunc>(context, listen: false).setCity(cityName);
    context.read<SearchList>().addCityToHistory(cityName);
  }
}
