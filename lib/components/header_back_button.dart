// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';

class HeaderBackButton extends StatelessWidget {
  final String tailTitle;
  final String backTitle;
  final Function onBack;

  HeaderBackButton({@required this.tailTitle, @required this.backTitle, @required this.onBack});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: this.onBack,
            child: Container(
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: gray,
                    ),
                  ),
                  Container(
                    child: Text(
                      this.backTitle,
                      style: TextStyle(
                        color: gray,
                        fontSize: fontSizeP,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Text(
              this.tailTitle,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: fontSizeP,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
