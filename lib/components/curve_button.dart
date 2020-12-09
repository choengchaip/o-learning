import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurveButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  CurveButton({@required this.title, @required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.only(
          top: 8, bottom: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                color: Theme
                    .of(context)
                    .primaryColor,
                padding: EdgeInsets.only(top: 12, bottom: 12),
                onPressed: this.onPressed,
                child: Text(
                  this.title,
                  style: TextStyle(
                      color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
