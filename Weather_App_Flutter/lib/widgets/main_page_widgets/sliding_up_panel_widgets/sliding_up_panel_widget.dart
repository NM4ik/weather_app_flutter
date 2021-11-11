import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app_flutter/widgets/main_page_widgets/sliding_up_panel_widgets/stick_sliding_panel.dart';
import 'package:weather_app_flutter/widgets/main_page_widgets/sliding_up_panel_widgets/panel_widget.dart';
import 'package:weather_app_flutter/provider/is_visible_sliding_up_widget.dart';
import 'package:provider/provider.dart';

class SlidingUpPanelWidget extends StatefulWidget {
  final PanelController panelController;

  const SlidingUpPanelWidget({Key? key, required this.panelController})
      : super(key: key);

  @override
  State<SlidingUpPanelWidget> createState() => _SlidingUpPanelWidgetState();
}

class _SlidingUpPanelWidgetState extends State<SlidingUpPanelWidget> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var minHeight = height * 0.4;
    return SlidingUpPanel(
      controller: widget.panelController,
      minHeight: height * 0.4,
      maxHeight: height * 0.68,
      parallaxOffset: .5,
      header: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: StickSliding(
          panelController: widget.panelController,
        )),
      ),
      // header: StickSliding(),
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      color: Color(0xFFE2EBFF),
      onPanelSlide: (minHeight) {
        setState(() {
          // if(widget.panelController.isPanelClosed){
          //   isVisible = false;
          // } else isVisible = true;
          if (widget.panelController.isPanelClosed) {
            // Provider.of<isVisibleProvider>(context, listen: false);
            context.read<isVisibleProvider>().panelClose();
          } else {
            // Provider.of<isVisibleProvider>(context, listen: false);
            context.read<isVisibleProvider>().panelOpen();
          }
        });
      },
      panelBuilder: (controller) => PanelWidget(
        controller: controller,
        isVisible: context.watch<isVisibleProvider>().isVisible,

        // isVisible: isVisible,
      ),
    );
  }
}
