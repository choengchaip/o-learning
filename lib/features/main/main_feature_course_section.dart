import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/states/course_data_types.dart';

class MainCourseSectionFeature extends StatelessWidget {
  final ICourseItem course;

  MainCourseSectionFeature({Key key, @required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.085),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 32),
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 10,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                  child: Text(
                    this.course.title,
                    style: TextStyle(
                        fontSize: fontSizeP, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(this.course.chapters.length, (index) {
              return GestureDetector(
                onTap: () {
                  if (this.course.chapters[index].canLearn) {}
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: this.course.chapters[index].canLearn ? Colors.black12 : Colors.transparent,
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
                              this.course.chapters[index].icon,
                              size: fontSizeH3,
                              color: this.course.chapters[index].canLearn
                                  ? Theme.of(context).primaryColor
                                  : Colors.black26,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            height: 50,
                            child: Text(
                              this.course.chapters[index].title,
                              style: TextStyle(
                                color: this.course.chapters[index].canLearn
                                    ? Colors.black
                                    : Colors.black26,
                                fontSize: fontSizeP,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: this.course.chapters[index].canLearn ? 1 : 0,
                            child: Container(
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 12, right: 12),
                              child: Icon(
                                Icons.star,
                                size: fontSizeH3,
                                color: this.course.chapters[index].isPassed
                                    ? Colors.yellow
                                    : Colors.black12,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: this.course.chapters[index].canLearn ? 1 : 0,
                            child: Container(
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: this.course.chapters[index].progress,
                                    child: Container(
                                      height: 8,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 100 -
                                        this.course.chapters[index].progress,
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
                ),
              );
            }),
          ),
          Container(
            height: 32,
          )
        ],
      ),
    );
  }
}
