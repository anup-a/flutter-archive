import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber[800],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dicee'),
          backgroundColor: Colors.red[600],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNumber = 2;
  int rightNumber = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    leftNumber = 1 + Random().nextInt(6);
                  });
                },
                child: Image.asset('images/dice$leftNumber.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    rightNumber = 1 + Random().nextInt(6);
                  });
                },
                child: Image.asset('images/dice$rightNumber.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        FlatButton(
          color: Colors.red[600],
          onPressed: () {
            setState(() {
              leftNumber = 1 + Random().nextInt(6);
              rightNumber = 1 + Random().nextInt(6);
            });
          },
          child: Text(
            'Roll Dice !',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
