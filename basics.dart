import 'package:flutter/material.dart';
import './Quiz.dart';
import './result.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyappState();
  }
}

class _MyappState extends State<Myapp> {
  final _questions = const [
    {
      'questionText': "what is the color of sky",
      'answer': [
        {'text': 'blue', 'score': 4},
        {'text': 'skyblue', 'score': 10},
        {'text': 'Grey', 'score': 10},
        {'text': 'white with clouds', 'score': 12}
      ]
    },
    {
      'questionText': "what is the your name ",
      'answer': [
        {'text': 'Atharva', 'score': 9},
        {'text': 'Gaikwad', 'score': 8},
        {'text': 'ALBERT', 'score': 50},
        {'text': 'Deeshaa', 'score': 20}
      ]
    },
    {
      'questionText': "Who is corona ",
      'answer': [
        {'text': 'virus', 'score': 5},
        {'text': 'bacteria', 'score': 10},
        {'text': 'Chinese Virus', 'score': 15},
        {'text': 'Kazak VIIras', 'score': 20}
      ]
    }
  ];

  var _totalScore = 0;
  var _questionIndex = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerChosen(int _score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    _totalScore = _totalScore + _score;

    if (_questionIndex < _questions.length) {
      print("You have more questions pending !!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("QUIZ APP"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerChosen: _answerChosen,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,resetQuiz)
      ),
    );
    
  }
}
