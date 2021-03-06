import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes{
  static final darkTheme = ThemeData(
    primaryColor: Colors.white,
    indicatorColor: const Color(0xffB1B1B1),
    cardColor: Colors.white,
    bottomAppBarColor: const Color(0xff071427),
    dividerColor: Colors.white,
    dialogBackgroundColor: const Color(0xff0C172B),
    backgroundColor:  const Color(0xff0C172B),
    selectedRowColor: const Color(0xffCCCCCC),
    splashColor: const Color(0xff223B70),
    highlightColor: const Color(0xFF152A53),
    buttonColor: const Color(0xff152A53),
    hoverColor: Colors.white,
    canvasColor: const Color(0xff0D172B),
    hintColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.black,
    indicatorColor: const Color(0xff5A5A5A),
    cardColor: const Color(0xffE2EBFF),
    bottomAppBarColor: const Color(0xffE2EBFF),
    dividerColor: const Color(0xff038CFE),
    dialogBackgroundColor: const Color(0xffE2EBFF),
    backgroundColor:  const Color(0xff4B5F88),
    selectedRowColor: Colors.black,
    splashColor: const Color(0xffCDDAF5),
    highlightColor: const Color(0xffC8DAFF),
    buttonColor: const Color(0xffC8DAFF),
    hoverColor: const Color(0xffE2EBFF),
    canvasColor: const Color(0xff4B5F88),
    hintColor: const Color(0xff038CFE),
  );
}