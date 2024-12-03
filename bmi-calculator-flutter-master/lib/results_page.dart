import 'package:bmi_calculator_2/bottom_button.dart';
import 'package:bmi_calculator_2/constants.dart';
import 'package:bmi_calculator_2/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmi,
      @required this.resultText,
      @required this.interpretation});

  final String bmi;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          backgroundColorStart: Color(0xfffa709a),
          backgroundColorEnd: Color(0xfffee140),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Results',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                // colour: cardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              title: 'RE-CALCULATE',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
