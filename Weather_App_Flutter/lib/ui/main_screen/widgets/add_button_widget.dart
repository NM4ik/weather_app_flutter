import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app_flutter/ui/search_screen/search.dart';
import 'package:weather_app_flutter/ui/settings_screen/settings.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      child: Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
              depth: 2,
              lightSource: LightSource.topLeft,
              color: Color(0x0161FE)
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: (SvgPicture.asset("assets/images/icon_add_button.svg", width: 28,)),
            onPressed: () {Navigator.of(context).push(MaterialPageRoute
              (builder: (context) => SearchPage(),));},
            iconSize: 30,
          )
      ),
    );
  }
}
