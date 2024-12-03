import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  Color _color = Color(0xFFFFFFFF); // Colors.grey[200]

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
        backgroundColor: Color.lerp(_color, Colors.white10, 0.005),
        scaffoldBackgroundColor: _color,
        dialogBackgroundColor: _color,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Colors.black,
          textTheme: TextTheme(
            title: TextStyle(
              color: Color(0x77FFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
