import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/header_back_button_center.dart';
import 'package:o_learning/features/main/main_feature_subject_chapter_list.dart';
import 'package:o_learning/mocks/subject_data_types.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/subject_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class MainSubjectCategoriesChapterFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final SubjectWidgetRepository subjectWidgetRepository;

  MainSubjectCategoriesChapterFeature({
    @required this.widgetSliderRepository,
    @required this.subjectWidgetRepository,
  });

  @override
  _MainSubjectCategoriesChapterFeature createState() =>
      _MainSubjectCategoriesChapterFeature(
        widgetSliderRepository: this.widgetSliderRepository,
        subjectWidgetRepository: this.subjectWidgetRepository,
      );
}

class _MainSubjectCategoriesChapterFeature
    extends State<MainSubjectCategoriesChapterFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  final SubjectWidgetRepository subjectWidgetRepository;

  _MainSubjectCategoriesChapterFeature({
    @required this.widgetSliderRepository,
    @required this.subjectWidgetRepository,
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Container(
      child: Column(
        children: [
          HeaderBackButtonCenter(
            headerTitle: this.subjectWidgetRepository.categoryItem.title,
            backTitle: 'Back',
            onBack: () {
              this.widgetSliderRepository.prevWidget();
            },
          ),
          MainSubjectChapterListFeature(
            items: mockCategoryChapters,
            onClick: (String id) {},
          ),
        ],
      ),
    );
  }
}
