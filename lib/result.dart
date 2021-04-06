import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartQuiz;
  Result(this.resultScore, this.restartQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'u r awsome';
    } else if (resultScore <= 12) {
      resultText = 'u r likable ';
    } else if (resultScore <= 16) {
      resultText = 'u r ..... Strange ';
    } else {
      resultText = 'u r so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: restartQuiz,
            child: Text('Restart Quiz'),
          )
        ],
      ),
    );
  }
}
