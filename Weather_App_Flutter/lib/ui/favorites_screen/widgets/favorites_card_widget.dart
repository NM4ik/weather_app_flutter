import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesCardWidget extends StatelessWidget {
  const FavoritesCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Container(
        child: Neumorphic(
          style: NeumorphicStyle(
            color: Color(0xFFDEE9FF),
            depth: -5,
            lightSource: LightSource.top,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  // color: Colors.red,
                  child: Text('Москва', style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black
                  ),),
                ),
                Container(
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      color: Color(0xFFC8DAFF),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        print('qwe');
                      },
                      iconSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // child: Padding( //input для поиска. Не то сверстал.
          //   padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       suffixIcon: Container(
          //         child: Neumorphic(
          //           child: IconButton(
          //             icon: Icon(Icons.close, color: Colors.black),
          //             onPressed: () {
          //               Scaffold.of(context).openDrawer();
          //             },
          //             iconSize: 20,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
