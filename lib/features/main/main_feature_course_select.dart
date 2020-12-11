import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/course_item.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/states/discovery_data_types.dart';

class MainCourseSelectFeature extends StatelessWidget {
  final bool isExpand;
  final List<IDiscoveryCourseItem> items;
  final Function(String id) onChanged;
  final AppLocaleRepository appLocaleRepository;

  StreamController<String> selectedCourse = StreamController<String>();
  ScrollController scrollController = ScrollController();

  MainCourseSelectFeature({
    @required this.isExpand,
    @required this.items,
    @required this.onChanged,
    @required this.appLocaleRepository,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: selectedCourse.stream,
      builder: (BuildContext context, snapshot) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          curve: Curves.ease,
          top: this.isExpand ? 50 + MediaQuery.of(context).padding.top : -300,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.85,
            color: Colors.white,
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              controller: this.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: this.items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    this.scrollController.animateTo(
                        (MediaQuery.of(context).size.width * 0.75) * index,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.ease);
                    this.selectedCourse.add(this.items[index].id);
                    this.onChanged(this.items[index].id);
                  },
                  child: CourseItem(
                    image: this.items[index].image,
                    title: this.items[index].title,
                    description: this.items[index].description,
                    progress: this.items[index].progress,
                    isActive: snapshot.data == this.items[index].id,
                    appLocaleRepository: appLocaleRepository,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
