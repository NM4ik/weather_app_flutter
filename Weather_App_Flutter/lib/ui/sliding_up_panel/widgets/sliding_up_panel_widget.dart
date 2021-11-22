import 'package:flutter/material.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/widgets/forecast_week_button_widget.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/widgets/header_date_widget.dart';
import 'package:weather_app_flutter/ui/sliding_up_panel/widgets/weather_card_widget.dart';
import 'weather_card_detail_widget.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final bool isVisible;

  const PanelWidget(
      {Key? key, required this.controller, required this.isVisible})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget>
    with SingleTickerProviderStateMixin {
  var widget1 = DetailWeatherElements();
  var widget2 = FullWeekButton(); //(* ￣︿￣)
  var currentWidget;

  @override
  void initState() {
    currentWidget = widget2;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.controller,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.isVisible ? SlidingUpDateWidget() : Container(),
                ],
              ),
              // Row(
              //   children: [
              //     widget.isVisible ? SlidingUpDateWidget()
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherCard(),
                  WeatherCard(),
                  WeatherCard(),
                  WeatherCard(),
                ],
              ),
              // AnimatedSwitcher(
                // transitionBuilder: (child, animation) => SlideTransition(
                //   position:
                //       Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                //           .animate(AnimationController(
                //               vsync: this,
                //               duration: Duration(milliseconds: 500))),
                //   // child: SizedBox.expand(child: child,),
                //   child: child,
                // ),
                // duration: Duration(milliseconds: 500),
                // reverseDuration: Duration(milliseconds: 500),
                // child: slideView(widget.isVisible),
                slideView(widget.isVisible),
                // child: currentWidget, // проверить animatedSwitcher на другом проекте. Если да - пытаться изменить провайдер, если нет то другие идеи.
                // widget.isVisible ? FullWeekButton() : DetailWeatherElements() Why this works badly?
              // )
            ],
          ),
        ),
      ],
    );
  }

  slideView(isVisible) {
    if (isVisible) {
      return DetailWeatherElements();
    }
    if (!isVisible) {
        return FullWeekButton();
    }
  }

// slideViewDate(isVisible){
//   if(isVisible){
//     SlidingUpDateWidget();
//   } else return ??;
// }
}
