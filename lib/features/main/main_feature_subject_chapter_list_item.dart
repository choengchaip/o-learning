import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';

class MainSubjectChapterListItemFeature extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String image;

  MainSubjectChapterListItemFeature({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: grayLighter,
          ),
        ),
      ),
      height: 110,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(this.image).image,
                    fit: BoxFit.cover,
                  ),
                ),
                width: 100,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.title,
                      style: TextStyle(
                        fontSize: fontSizeH4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        this.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: fontSizeS1,
                          color: gray,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}