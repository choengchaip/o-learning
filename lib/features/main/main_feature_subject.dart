import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class MainSubjectFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  MainSubjectFeature({@required this.pageSliderRepository});

  @override
  _MainSubjectFeature createState() => _MainSubjectFeature(pageSliderRepository: this.pageSliderRepository);
}

class _MainSubjectFeature extends State<MainSubjectFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _MainSubjectFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this.widgetSliderRepository.initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Text('Course Page'),
            ),
          )
        ],
      ),
    );
  }
}
