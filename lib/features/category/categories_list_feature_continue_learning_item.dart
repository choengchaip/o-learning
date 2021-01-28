import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/cache_image.dart';

class CategoriesListContinueLearningItemFeature extends StatelessWidget {
  final String image;
  final String title;
  final int progress;
  final int totalChoice;

  CategoriesListContinueLearningItemFeature({
    @required this.image,
    @required this.title,
    @required this.progress,
    @required this.totalChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 3,
              spreadRadius: 0),
        ],
      ),
      width: 140,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 11,
              child: CacheImage(
                image: this.image,
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(left: 12, right: 12),
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: Text(
                  'COURSE ${this.progress ?? '0'}/${this.totalChoice ?? 0}',
                  style: TextStyle(
                    fontSize: fontSizeS2,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: Container(
                padding: EdgeInsets.only(left: 12, right: 12),
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: Text(
                  this.title,
                  style: TextStyle(
                    fontSize: fontSizeP,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: grayLighter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
