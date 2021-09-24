import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your color?',
      'answer': [
        {'text': 'Red', 'score': 10},
        {'text': 'Black', 'score': 5},
        {'text': 'Blue', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite anmimal?',
      'answer': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your favourite place?',
      'answer': [
        {'text': 'NYC', 'score': 10},
        {'text': 'London', 'score': 10},
        {'text': 'America', 'score': 10},
        {'text': 'India', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          // body: Text('This is my default text'),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}

// RaisedButton(
//   child: Text('Answer1'),
//   onPressed: _answerquestion,
// ),
// RaisedButton(
//   child: Text('Answer2'),
//   onPressed: () => print('Answer 2 chosen'),
// ),
// RaisedButton(
//   child: Text('Answer3'),
//   onPressed: () {
//     print('ANswer 3 chosen');
//   },
// ),
