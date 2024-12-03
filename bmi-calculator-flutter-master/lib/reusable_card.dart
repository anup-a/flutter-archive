import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: NeuCard(
        curveType: CurveType.concave,
        margin: EdgeInsets.all(15.0),
        color: Colors.blue,
        bevel: 12,
        decoration:
            NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            //   color: colour,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
