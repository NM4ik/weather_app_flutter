import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/provider/general_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _cityTextController = TextEditingController();
  bool _validate = false;
  bool _toggle = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2EBFF),
      appBar: AppBar(
        title: TextField(
          onSubmitted: (value) {
            _cityTextController.text.isEmpty
                ? _validate = true
                : _validate = false;
            if (!_validate) {
              _search(_cityTextController.text);
              Future.delayed(Duration(milliseconds: 800), () {
                Navigator.pop(context);
              });
            }
          },
          controller: _cityTextController,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            labelText: 'Enter the Value',
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
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              _cityTextController.clear();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 30),
        child: ListView.builder(
            itemCount: context.watch<SearchList>().citises.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  String city = Provider.of<SearchList>(context, listen: false)
                      .citises[index]
                      .toString();
                  _search(city);
                  Future.delayed(Duration(milliseconds: 800), () {
                    Navigator.pop(context);
                  });
                },
                title: Text(
                  context.watch<SearchList>().citises[index],
                  //   Provider.of<SearchList>(context).citises[index].name,
                  style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                trailing: IconButton(
                  icon: _toggle
                      ? Icon(
                          Icons.star,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.star_border,
                          color: Colors.black,
                        ),
                  onPressed: () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },
                ),
              );
            }),
      ),
    );
  }

  void _search(String text) {
    String cityName = text;
    Provider.of<InitialFunc>(context, listen: false).setCity(cityName);
    context.read<SearchList>().addCityToHistory(cityName);
  }
}
