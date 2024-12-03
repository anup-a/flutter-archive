import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 85.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            label,
            style: cardTextStyle,
          )
        ],
      ),
    );
  }
}
