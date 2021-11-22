import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/main.dart';


class FarecastWeekButtonWidget extends StatelessWidget {
  const FarecastWeekButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: RaisedButton(
        color: Color(0xFFE2EBFF),
        textColor: Color(0xFF038CFE),
        shape: StadiumBorder(
          side: BorderSide(color: Colors.black, width: 1),
        ),
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Main()));
          Navigator.pop(context);
        },
        child: Text('Вернуться на главную', style: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),),
      ),
    );
  }
}
