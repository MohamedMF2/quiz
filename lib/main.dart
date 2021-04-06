import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _questions = [
    {
      'questionText': 'what is your favourite color ?',
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Black', 'score': 3},
        {'text': 'Yello', 'score': 5},
        {'text': 'Green', 'score': 9},
      ],
    },
    {
      'questionText': 'what is your favourite animal ?',
      'answers': [
        {'text': 'Snake', 'score': 1},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'who is your favourite instructor ?',
      'answers': [
        {'text': 'Eman', 'score': 1},
        {'text': 'Nasr', 'score': 3},
        {'text': 'Staphan', 'score': 5},
        {'text': 'Max', 'score': 9},
      ],
    },
  ];

  var _totalScore = 0;
  void _answerQuestions(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('there is more questions ');
    } else {
      print('u did it');
    }
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestions: _answerQuestions,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
