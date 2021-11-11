import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String title;
  final bool isCorrect;
  final Function onChangeAnswer;
  // final Function onChange22;

  const Answer({Key key, this.title, this.isCorrect, this.onChangeAnswer}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChangeAnswer(isCorrect),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 10
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 3))],
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Text('$title' ?? 'hello', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
      ),
    );
  }

}
