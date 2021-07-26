import 'package:flutter/material.dart';
import './answers.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerChosen;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerChosen,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerChosen(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
