import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/pages/settings_page.dart';

class FullWeekButton extends StatelessWidget {
  const FullWeekButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      curve: Curves.easeInOut,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: RaisedButton(
          color: Color(0xFFE2EBFF),
          textColor: Color(0xFF038CFE),
          shape: StadiumBorder(
            side: BorderSide(color: Color(0xFF038CFE), width: 1),
          ),
          onPressed: () {Navigator.of(context).push(MaterialPageRoute
            (builder: (context) => SettingPage(),));},
          child: Text('Прогноз на неделю', style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),),
        ),
      ),
    );
  }
}
