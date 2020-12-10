import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';

class CurveButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry margin;
  final Function onPressed;
  final bool isDisabled;

  CurveButton(
      {@required this.title,
      @required this.onPressed,
      this.margin,
      this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 8, bottom: 16),
      margin: this.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.only(top: 12, bottom: 12),
                onPressed: this.isDisabled == true ? null : this.onPressed,
                child: Text(
                  this.title,
                  style: TextStyle(color: Colors.white, fontSize: fontSizeH4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
