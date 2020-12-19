import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';

class QuizProgressFeature extends StatelessWidget {
  final double progress;

  QuizProgressFeature({
    @required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    bool isMax() {
      return num.parse(MediaQuery.of(context).size.width.toStringAsFixed(8)).toDouble() == this.progress;
    }

    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: grayLighter,
        boxShadow: [
          BoxShadow(
              color: grayLight,
              offset: Offset(0, 0.75),
              blurRadius: 4,
              spreadRadius: 0),
        ],
      ),
      height: 8,
      width: MediaQuery.of(context).size.width,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        curve: Curves.ease,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(isMax() ? 0 : 4),
            bottomRight: Radius.circular(isMax() ? 0 : 4),
          ),
        ),
        height: 8,
        width: this.progress,
      ),
    );
  }
}
