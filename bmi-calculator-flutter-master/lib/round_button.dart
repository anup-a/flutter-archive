import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return NeuButton(
      onPressed: onPressed,
      shape: BoxShape.circle,
      child: RawMaterialButton(
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width: 40.0,
          height: 40.0,
        ),
        shape: CircleBorder(),
        // fillColor: Color(0xFF4C4F5E),
        child: Icon(icon),
      ),
    );
  }
}
