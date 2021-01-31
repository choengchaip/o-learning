import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/states/course_data_types.dart';
import 'package:o_learning/states/subject_data_types.dart';

class SubjectQuizItemFeature extends StatelessWidget {
  final title;
  final List<IModule> items;
  final Function(String id, List<ISubModule> quizItems) onClick;

  SubjectQuizItemFeature({
    @required this.title,
    @required this.items,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 16,
            right: 16,
          ),
          child: Text(
            this.title ?? '',
            style: TextStyle(
              fontSize: fontSizeP,
              color: Colors.black,
            ),
          ),
        ),
        ...List.generate(this.items.length, (index) {
          return GestureDetector(
            onTap: () {
              this.onClick(this.items[index].id, this.items[index].subModules);
            },
            child: Container(
              color: index % 2 == 0 ? Colors.white : primaryColorLighter,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Theme.of(context).primaryColorDark
                          : Theme.of(context).primaryColorLight,
                      shape: BoxShape.circle,
                    ),
                    child: index == 0
                        ? Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          )
                        : Text(
                            index.toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Text(
                        this.items[index].title ?? '',
                        style: TextStyle(
                          fontSize: fontSizeP,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   child: Text(
                  //     '0 / ${this.items[index].subModules.length}',
                  //     // '${this.items[index].progress.toString()}/${this.items[index].totalChoice.toString()}',
                  //     style: TextStyle(
                  //       fontSize: fontSizeS1,
                  //       fontWeight: FontWeight.w100,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
