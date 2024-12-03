import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:neumorphic/neumorphic.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'round_button.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calc_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int heightNumber = 180;
  int weight = 60;
  int age = 20;

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
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      // colour: selectedGender == Gender.male
                      //     ? cardColor
                      //     : inactiveColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),

                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      // colour: selectedGender == Gender.female
                      //     ? cardColor
                      //     : inactiveColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                // colour: cardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: cardTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          heightNumber.toString(),
                          style: heightTextStyle,
                        ),
                        Text(
                          'cm',
                          style: cardTextStyle,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: bottomContainerColor,
                          activeTrackColor: Colors.black,
                          inactiveTrackColor: Color(0xff8d8e98),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          trackHeight: 4.0,
                        ),
                        child: Slider(
                          value: heightNumber.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              heightNumber = newValue.toInt();
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      // colour: cardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: cardTextStyle),
                          Text(
                            weight.toString(),
                            style: heightTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      // colour: cardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: cardTextStyle),
                          Text(
                            age.toString(),
                            style: heightTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              title: 'CALCULATE',
              onPress: () {
                CalculatorBrain calcBrain =
                    CalculatorBrain(height: heightNumber, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: calcBrain.getBMI(),
                      resultText: calcBrain.getResult(),
                      interpretation: calcBrain.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        )),
      ),
    );
  }
}
