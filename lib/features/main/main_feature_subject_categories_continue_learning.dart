import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/features/main/main_feature_subject_categories_continue_learning_item.dart';
import 'package:o_learning/states/subject_data_types.dart';

class MainSubjectCategoriesContinueLearningFeature extends StatelessWidget {
  final String title;
  final List<IContinueLearningItem> items;
  final Function(String id) onClick;

  MainSubjectCategoriesContinueLearningFeature({
    @required this.title,
    @required this.items,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16,
        bottom: 32,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: fontSizeP,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 193,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                top: 8,
                bottom: 8,
                left: 16,
                right: 16,
              ),
              itemCount: this.items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    this.onClick(this.items[index].id);
                  },
                  child: MainSubjectCategoriesContinueLearningItemFeature(
                    title: this.items[index].title,
                    image: this.items[index].image,
                    progress: this.items[index].progress,
                    totalChoice: this.items[index].totalChoice,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
