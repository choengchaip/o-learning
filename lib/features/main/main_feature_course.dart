import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class MainCourseFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  MainCourseFeature({@required this.pageSliderRepository});

  @override
  _MainCourseFeature createState() => _MainCourseFeature(pageSliderRepository: this.pageSliderRepository);
}

class _MainCourseFeature extends State<MainCourseFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _MainCourseFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this.widgetSliderRepository.initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(),
    );
  }
}
