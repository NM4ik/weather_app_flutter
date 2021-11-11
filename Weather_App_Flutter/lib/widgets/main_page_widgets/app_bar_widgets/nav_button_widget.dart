import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NavButton extends StatelessWidget {
  const NavButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      child: Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
              depth: 2,
              lightSource: LightSource.topLeft,
              color: Color(0x0161FE)),
          child: IconButton(
            icon: Icon(Icons.menu_rounded, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            iconSize: 20,
          )),

      // decoration: BoxDecoration(
      //   color: Color(0x0256FF),
      //   borderRadius: BorderRadius.circular(50),
      //   // boxShadow: [
      //   //   BoxShadow(
      //   //     color: Colors.white.withOpacity(0.2),
      //   //     // spreadRadius: 15,
      //   //     blurRadius: 10,
      //   //   ),
      //   // ],
      // ),
      // child: IconButton(
      //   icon: Icon(Icons.menu_rounded, color: Colors.white),
      //   onPressed: () {
      //     print("he");
      //   },
      //   iconSize: 30,
      // ),
    );
  }
}
