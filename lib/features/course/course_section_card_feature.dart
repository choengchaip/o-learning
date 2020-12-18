import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';

class CourseSectionCardFeature extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool canLearn;
  final bool isPassed;
  final int progress;

  CourseSectionCardFeature({
    @required this.title,
    @required this.icon,
    @required this.canLearn,
    @required this.isPassed,
    @required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              color: this.canLearn ? Colors.black12 : Colors.transparent,
              offset: Offset(0, 3),
              blurRadius: 1,
              spreadRadius: 0),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 6,
                  spreadRadius: 6),
            ],
          ),
          width: (MediaQuery.of(context).size.width / 2) - 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 8, left: 12, right: 12),
                margin: EdgeInsets.only(bottom: 4),
                child: Icon(
                  this.icon,
                  size: fontSizeH3,
                  color: this.canLearn
                      ? Theme.of(context).primaryColor
                      : Colors.black26,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12, right: 12),
                height: 50,
                child: Text(
                  this.title,
                  style: TextStyle(
                    color: this.canLearn ? Colors.black : Colors.black26,
                    fontSize: fontSizeP,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Opacity(
                opacity: this.canLearn ? 1 : 0,
                child: Container(
                  padding: EdgeInsets.only(bottom: 8, left: 12, right: 12),
                  child: Icon(
                    Icons.star,
                    size: fontSizeH3,
                    color: this.isPassed ? Colors.yellow : Colors.black12,
                  ),
                ),
              ),
              Opacity(
                opacity: this.canLearn ? 1 : 0,
                child: Container(
                  child: Row(
                    children: [
                      Flexible(
                        flex: this.progress,
                        child: Container(
                          height: 8,
                          color: Colors.yellow,
                        ),
                      ),
                      Flexible(
                        flex: 100 - this.progress,
                        child: Container(
                          height: 8,
                          color: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
