import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';
import 'package:weather_app_flutter/ui/search_screen/search.dart';


class SearchEntity extends StatefulWidget {
  const SearchEntity({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<SearchEntity> createState() => _SearchEntityState();
}

class _SearchEntityState extends State<SearchEntity> {
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        String city = Provider.of<SearchList>(context, listen: false)
            .citises[widget.index]
            .toString();
        _search(city);
        Future.delayed(const Duration(milliseconds: 800), () {
          Navigator.pop(context);
        });
      },
      title: Text(
        context.watch<SearchList>().citises[widget.index],
        //   Provider.of<SearchList>(context).citises[index].name,
        style: GoogleFonts.manrope(
            color: Theme.of(context).primaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w600),
      ),
      trailing: IconButton(
        icon: Provider.of<SearchList>(context).searchingForEmpty(context.watch<SearchList>().citises[widget.index])
            ?  Icon(
          Icons.star,
          color: Theme.of(context).primaryColor,
        )
            :  Icon(
          Icons.star_border,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          setState(() {
            // _toggle = !_toggle;
            if(Provider.of<SearchList>(context, listen: false).searchingForEmpty(Provider.of<SearchList>(context, listen: false).citises[widget.index])) {
              Provider.of<SearchList>(context, listen: false).popCityFromFavorites(Provider.of<SearchList>(context, listen: false)
                .citises[widget.index]
                .toString());
            } else {
              Provider.of<SearchList>(context, listen: false).addCityToFavorite(Provider.of<SearchList>(context, listen: false)
                  .citises[widget.index]
                  .toString());
            }
          });
        },
      ),
    );
  }
  void _search(String text) {
    String cityName = text;
    Provider.of<InitialFunc>(context, listen: false).setCity(cityName);
    context.read<SearchList>().addCityToHistory(cityName);
  }
}
