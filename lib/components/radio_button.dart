// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final bool active;
  final Function onPressed;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  RadioButton({@required this.active, this.onPressed, this.padding, this.margin});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: this.padding,
        margin: this.margin,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              width: 25,
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: this.active ? Colors.white : Theme.of(context).primaryColor,
              ),
              width: 10,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
