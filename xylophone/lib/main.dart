import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note1.wav');
                  },
                  child: Text('play'),
                  color: Colors.cyan[100],
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note2.wav');
                  },
                  child: Text('play'),
                  color: Colors.cyan[200],
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note3.wav');
                  },
                  child: Text('play'),
                  color: Colors.cyan[300],
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note4.wav');
                  },
                  child: Text('play'),
                  color: Colors.cyan[400],
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note5.wav');
                  },
                  child: Text('play'),
                  color: Colors.cyan[500],
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note6.wav');
                  },
                  child: Text('play'),
                  color: Colors.cyan[600],
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note7.wav');
                  },
                  child: Text('play'),
                  color: Colors.cyan[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
