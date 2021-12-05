// import 'package:provider/provider.dart';
// import 'package:weather_app_flutter/api/models.dart';
// import 'package:weather_app_flutter/provider/settings_provider.dart';
// import 'package:weather_app_flutter/ui/settings_screen/widgets/settings_screen_card_widget.dart';
//
//
// class TemperatureInfoConvert{
//   final String temp;
//   final Map<String, int> setting;
//   TemperatureInfoConvert({ required this.response, required this.setting});
//
//   factory TemperatureInfoConvert.factory(String response, Map<String, int> setting){
//     var temperature;
//
//     setting.forEach((key, value) {
//       if(key == "Температура"){
//         if(value == 0){
//           temperature = 0;
//         } else {
//           temperature = 1;
//         }
//       }
//     });
//
//     if(temperature == 0){
//       response =  "${int.parse(response).toString()} + C";
//     } else {
//       response =  "${(int.parse(response)/2)} + F".toString();
//     }
//    return TemperatureInfoConvert(response: response, setting: setting);
//   }
// }