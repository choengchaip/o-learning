import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/features/main/main_feature_subject_categories_continue_learning.dart';
import 'package:o_learning/features/main/main_feature_subject_categories_recommend.dart';
import 'package:o_learning/mocks/subject_data_types.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class MainSubjectCategoriesFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  MainSubjectCategoriesFeature({
    @required this.widgetSliderRepository,
  });

  @override
  _MainSubjectCategoriesFeature createState() => _MainSubjectCategoriesFeature(
        widgetSliderRepository: this.widgetSliderRepository,
      );
}

class _MainSubjectCategoriesFeature
    extends State<MainSubjectCategoriesFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  _MainSubjectCategoriesFeature({
    @required this.widgetSliderRepository,
  });

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Stack(
      children: [
        Container(
          color: grayLighter,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              MainSubjectCategoriesContinueLearningFeature(
                title: 'Continue Learning',
                items: mockContinueLearning,
              ),
              MainSubjectCategoriesRecommendFeature(
                title: 'Recommend Courses',
                items: mockRecommend,
              ),
            ],
          ),
        )
      ],
    );
  }
}
