import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  final Function resetB;

  Result(this.resultScore, this.resetB);
  String get resultPhrase {
    // ignore: non_constant_identifier_names
    String ResultText="You are less successfull";
    if (resultScore < 10) {
      ResultText = "You are bit more succefull in the task";
    } else if (resultScore < 15) {
      ResultText = "You are quite succesfull in the task";
    } else if (resultScore > 30) {
      ResultText = "YOU ARE A GENIUS";
    } 
    return ResultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 28, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        FlatButton(
          onPressed: resetB,
          child: Text('TRY AGAIN ?? '),
          textColor: Colors.black38,
          splashColor: Colors.blue,
        )
      ],
    );
  }
}
