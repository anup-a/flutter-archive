import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: magicBall(),
      ),
    );

class magicBall extends StatefulWidget {
  @override
  _magicBallState createState() => _magicBallState();
}

class _magicBallState extends State<magicBall> {
  int ball_number = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: FlatButton(
        onPressed: () {
          setState(() {
            ball_number = 1 + Random().nextInt(5);
          });
        },
        child: Image.asset('images/ball$ball_number.png'),
      ),
    );
  }
}
