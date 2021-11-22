import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SlidingUpDateWidget extends StatefulWidget {
  const SlidingUpDateWidget({Key? key}) : super(key: key);

  @override
  State<SlidingUpDateWidget> createState() => _SlidingUpDateWidgetState();
}

class _SlidingUpDateWidgetState extends State<SlidingUpDateWidget> {
  String dateNow = DateFormat('yMMMd', 'ru').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: AnimatedSwitcher(
        reverseDuration: Duration(milliseconds: 500),
        duration: Duration(milliseconds: 2000),
        child: Text(dateNow , style: GoogleFonts.manrope(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black
        ),),
      ),
    );
  }
}
