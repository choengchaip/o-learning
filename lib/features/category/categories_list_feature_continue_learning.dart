// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/features/category/categories_list_feature_continue_learning_item.dart';
import 'package:o_learning/states/course_data_types.dart';

class CategoriesListContinueLearningFeature extends StatelessWidget {
  final String title;
  final List<ICourseItem> items;
  final Function(String id) onClick;

  CategoriesListContinueLearningFeature({
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
                  child: CategoriesListContinueLearningItemFeature(
                    index: index,
                    title: this.items[index].title,
                    image: this.items[index].image,
                    progress: this.items[index].current,
                    totalChoice: this.items[index].max,
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
