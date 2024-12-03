import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.title, this.onPress});

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kBottomTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xfffa709a), Color(0xfffee140)])),
      ),
    );
  }
}
