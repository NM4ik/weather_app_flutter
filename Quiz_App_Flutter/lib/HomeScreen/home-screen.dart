import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/answerCard.dart';
import 'package:quiz_app/Widgets/progress_bar.dart';
import 'package:quiz_app/Questions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  void _clearState() => setState(() {
        _questionIndex = 0;
        _countResult = 0;
        _icons = [];
      });

  void _onChangeAnswer(bool isCorrect) => setState(() {
        if (isCorrect) {
          print("hello");
          _icons.add(Icon(Icons.brightness_1, color: Colors.green));
          _countResult++;
        } else {
          _icons.add(Icon(Icons.brightness_1, color: Colors.red));
        }

        _questionIndex++;
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            ProgressBar(
                icons: _icons,
                count: _questionIndex,
                total: sample_data.length),
            Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(2, 1),
                        spreadRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrange,
                ),
                child: Text(
                  sample_data[_questionIndex]['question'].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),

            ...sample_data[_questionIndex]['options']
                .map((value) => Answer(
                      title: value, onChangeAnswer: _onChangeAnswer, isCorrect:
            sample_data[_questionIndex]['options'][int.parse
              (sample_data[_questionIndex]['answer_index'])] == value,
                    ))
                .toList(), //работает, но мне нужно передавать вторым параметром isCorrect.contains('answer_index') ? true : false
            // чтобы проверять , является ли ответ правильным. Третим параметром передавать функцию onChange.. : _onChange

            // ...sample_data[_questionIndex].map(
            //     (value) => Answer(title: value['options'].toString(), )
            // ).toList(),
          ],
        ),
      ),
    );
  }
}
