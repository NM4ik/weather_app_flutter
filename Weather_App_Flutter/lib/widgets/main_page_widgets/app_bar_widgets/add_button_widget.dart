import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';

class AddButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      child: Neumorphic(
          style: NeumorphicStyle(
              // border: NeumorphicBorder(color: Colors.white, width: 1), if use icon like icon, then need border. How to collapsed him?
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
              depth: 2,
              lightSource: LightSource.topLeft,
              color: Color(0x0161FE)
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            // icon: Icon(Icons.add_circle_outline_rounded, color: Colors.white),
            icon: (SvgPicture.asset("assets/images/icon_add_button.svg", width: 28,)),
            onPressed: () {
              print("he");
            },
            iconSize: 30,
          )
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(50),
      //   // boxShadow: [
      //   //   BoxShadow(
      //   //     color: Colors.white.withOpacity(0.2),
      //   //     spreadRadius: 1,
      //   //     blurRadius: 10,
      //   //     offset: Offset(-1, -2),
      //   //
      //   //   )
      //   // ]
      // ),
      // child: IconButton(
      //   icon: Icon(Icons.add_circle_outline_rounded, color: Colors.white),
      //   onPressed: () {
      //     print("he");
      //   },
      //   iconSize: 30,
      // ),
    );
  }
}
