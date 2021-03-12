// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/cache_image.dart';
import 'package:o_learning/components/header_back_button_center.dart';
import 'package:o_learning/features/subject/subject_feature_quiz_item.dart';
import 'package:o_learning/mocks/main_data.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/repository/subject_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/states/course_data_types.dart';
import 'package:provider/provider.dart';

class SubjectQuizFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  SubjectQuizFeature({
    @required this.widgetSliderRepository,
  });

  @override
  _SubjectQuizFeature createState() => _SubjectQuizFeature(
        widgetSliderRepository: this.widgetSliderRepository,
      );
}

class _SubjectQuizFeature extends State<SubjectQuizFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  _SubjectQuizFeature({
    @required this.widgetSliderRepository,
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);
    SubjectRepository subjectRepository =
        Provider.of<SubjectRepository>(context);

    return Container(
      child: Column(
        children: [
          HeaderBackButtonCenter(
            headerTitle: subjectRepository.courseItem.title,
            backTitle: 'Back',
            onBack: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CacheImage(
                    height: 250,
                    image: subjectRepository.courseItem.image,
                  ),
                  SubjectQuizItemFeature(
                    title: subjectRepository.courseItem.description,
                    onClick: (String id, List<ISubModule> quizItems) async {
                      await quizRepository.getQuizDetail('', quizItems);
                      quizRepository.expandQuizFeature();
                    },
                    items: subjectRepository.courseItem.modules,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
