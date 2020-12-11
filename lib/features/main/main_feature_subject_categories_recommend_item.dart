import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';

class MainSubjectCategoriesRecommendItemFeature extends StatelessWidget {
  final String image;
  final String title;

  MainSubjectCategoriesRecommendItemFeature({
    @required this.image,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 140,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset(this.image).image,
                          fit: BoxFit.cover),
                    ),
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
      ),
    );
  }
}
