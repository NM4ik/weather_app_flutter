import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/api/data_sevice.dart';
import 'package:weather_app_flutter/api/models.dart';
import 'package:weather_app_flutter/ui/main_screen/main_screen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.setCity}) : super(key: key);
  final Function(String) setCity;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _cityTextController = TextEditingController();
  List<String> cities = ['Moscow'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Color(0xFFE2EBFF),
      appBar: AppBar(
        title: TextField(
          controller: _cityTextController,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          style: GoogleFonts.manrope(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          cursorColor: Colors.black,
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            // icon: Icon(Icons.add_circle_outline_rounded, color: Colors.white),
            icon: (SvgPicture.asset(
              "assets/images/search.svg",
              width: 18,
              color: Colors.black,
            )),
            //Почему cancel.svg не найден...
            onPressed: () {
              _search();
              // Navigator.of(context).pop;
              Future.delayed(Duration(milliseconds: 800), () {
                Navigator.pop(context);
              });
            },
            iconSize: 30,
          )
        ],
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
      body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (BuildContext context, int index) {
            return new Text(
              cities[index],
              style: TextStyle(color: Colors.white, fontSize: 24),
            );
          }),
    );
  }

  void _search() {
    String cityName = _cityTextController.text;
    widget.setCity(cityName);
    setState(() {
      cities.add(cityName);
    });
    // Navigator.of(context).pop;
  }
}
