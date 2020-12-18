import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/features/course/course_section_card_feature.dart';
import 'package:o_learning/states/course_data_types.dart';

class CourseSectionFeature extends StatelessWidget {
  final ICourseItem course;
  final Function(String id) onClick;
  Widget topWidget;

  CourseSectionFeature(
      {Key key, @required this.course, @required this.onClick, this.topWidget})
      : super(key: key) {
    if (this.topWidget == null) {
      this.topWidget = Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grayLighter,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 32),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                this.topWidget,
                Container(
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
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 16, right: 16),
                        child: Text(
                          this.course.title,
                          style: TextStyle(
                              fontSize: fontSizeP, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
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
                child: CourseSectionCardFeature(
                  title: this.course.chapters[index].title,
                  icon: this.course.chapters[index].icon,
                  canLearn: this.course.chapters[index].canLearn,
                  isPassed: this.course.chapters[index].isPassed,
                  progress: this.course.chapters[index].progress,
                  onClick: this.onClick,
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
