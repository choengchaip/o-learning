import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/subject/subject_feature_quiz.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class SubjectFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  SubjectFeature({@required this.pageSliderRepository});

  @override
  _SubjectFeature createState() =>
      _SubjectFeature(pageSliderRepository: this.pageSliderRepository);
}

class _SubjectFeature extends State<SubjectFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _SubjectFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this
        .widgetSliderRepository
        .initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: WidgetSlider(
              widgetSliderRepository: this.widgetSliderRepository,
              scrollable: false,
              showDot: false,
              components: [
                IWidgetSlider(
                  component: SubjectQuizFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
