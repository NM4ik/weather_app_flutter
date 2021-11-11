import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/widgets/main_page_widgets/app_bar_widgets/degress_widget.dart';
import 'nav_button_widget.dart';
import 'degress_widget.dart';
import 'add_button_widget.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Column(
          children: [
            Row( //header
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavButton(),
                Degreess(),
                AddButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
