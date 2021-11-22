import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class StickSliding extends StatelessWidget {
  final PanelController panelController;

  const StickSliding({Key? key, required this.panelController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF038CFE),
            borderRadius: BorderRadius.circular(5),
          ),
          width: 60, //60px
          height: 6, //3px
        ),
        onTap: togglePanel,
      ),
    );
  }


  void togglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();
  // void togglePanel() {
  //   if(panelController.isPanelOpen){
  //     panelController.close();
  //   } else panelController.open();
  // }
}
