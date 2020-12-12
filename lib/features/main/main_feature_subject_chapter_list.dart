import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/features/main/main_feature_subject_chapter_list_item.dart';
import 'package:o_learning/states/course_data_types.dart';

class MainSubjectChapterListFeature extends StatelessWidget {
  final List<IChapterItem> items;
  final Function(String id) onClick;

  MainSubjectChapterListFeature({
    @required this.items,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: this.items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                this.onClick(this.items[index].id);
              },
              child: MainSubjectChapterListItemFeature(
                id: this.items[index].id,
                title: this.items[index].title,
                description: this.items[index].description,
                image: this.items[index].image,
              ),
            );
          },
        ),
      ),
    );
  }
}
