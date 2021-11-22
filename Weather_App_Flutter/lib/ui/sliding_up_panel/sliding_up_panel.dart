import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/widgets/header_stick_widget.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/widgets/sliding_up_panel_widget.dart';
import 'package:weather_app_flutter/provider/is_visible_provider.dart';
import 'package:provider/provider.dart';

class SlidingUpPanelWidget extends StatefulWidget {
  final PanelController panelController;

  const SlidingUpPanelWidget({Key? key, required this.panelController})
      : super(key: key);

  @override
  State<SlidingUpPanelWidget> createState() => _SlidingUpPanelWidgetState();
}

class _SlidingUpPanelWidgetState extends State<SlidingUpPanelWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var minHeight = height * 0.4;
    return SlidingUpPanel(
      controller: widget.panelController,
      minHeight: height * 0.4,
      maxHeight: height * 0.68,
      header: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: StickSliding(
          panelController: widget.panelController,
        )),
      ),
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      color: Color(0xFFE2EBFF),
      onPanelClosed: () {
        context.read<isVisibleProvider>().panelClose();
      },
      onPanelOpened: () {
        context.read<isVisibleProvider>().panelOpen();
      },
      panelBuilder: (controller) => PanelWidget(
        controller: controller,
        isVisible: context.watch<isVisibleProvider>().isVisible,
      ),
    );
  }
}
