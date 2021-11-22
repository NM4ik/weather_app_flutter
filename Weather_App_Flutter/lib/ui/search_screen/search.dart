import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/api/data_sevice.dart';
import 'package:weather_app_flutter/api/models.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  late WeatherResponse _response;

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
            icon: (SvgPicture.asset("assets/images/icon_add_button.svg", width: 28, color: Colors.black,)), //Почему cancel.svg не найден...
            onPressed: _search,
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
      body: Container(),
    );
  }

  void _search() async{
    // final response = await _dataService.getWeather(_cityTextController.text);
    final response = await _dataService.getWeather(_cityTextController.text);
    // setState(() => _response = response);
  }
}
