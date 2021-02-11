import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/cache_image.dart';
import 'package:o_learning/repository/app_locale_repository.dart';

class CourseItem extends StatelessWidget {
  final int index;
  final String image;
  final String title;
  final String description;
  final bool isActive;
  final EdgeInsetsGeometry margin;
  final int progress;
  final AppLocaleRepository appLocaleRepository;

  CourseItem({
    @required this.index,
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.isActive,
    @required this.appLocaleRepository,
    this.margin,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              this.isActive
                  ? BoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 0,
                      spreadRadius: 3)
                  : BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 1),
                      blurRadius: 6,
                      spreadRadius: 1)
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: CacheImage(
                    errorImageAsset: 'lib/statics/default/courses/course_${this.index % 4}.jpg',
                    image: this.image,
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            this.title,
                            style: TextStyle(
                                color: dark,
                                fontSize: fontSizeP,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              this.description,
                              style: TextStyle(
                                  color: gray,
                                  fontSize: fontSizeS2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        this.progress != null
                            ? Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${this.progress}% ${appLocaleRepository.$l('course_item', 'completed')}',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: fontSizeS1,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
