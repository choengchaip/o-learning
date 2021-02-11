import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/cache_image.dart';

class CategoriesListRecommendItemFeature extends StatelessWidget {
  final int index;
  final String image;
  final String title;

  CategoriesListRecommendItemFeature({
    @required this.index,
    @required this.image,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 140,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                child: CacheImage(
                  errorImageAsset: 'lib/statics/default/courses/course_${this.index % 4}.jpg',
                  image: this.image,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: fontSizeS1,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
