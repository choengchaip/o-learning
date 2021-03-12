// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/header_back_button_center.dart';
import 'package:o_learning/components/loading.dart';
import 'package:o_learning/features/chapter/chapter_feature_list.dart';
import 'package:o_learning/mocks/subject_data_types.dart';
import 'package:o_learning/pages/subject_detail_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/subject_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class ChapterFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  ChapterFeature({
    @required this.widgetSliderRepository,
  });

  @override
  _MainSubjectCategoriesChapterFeature createState() =>
      _MainSubjectCategoriesChapterFeature(
        widgetSliderRepository: this.widgetSliderRepository,
      );
}

class _MainSubjectCategoriesChapterFeature extends State<ChapterFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  _MainSubjectCategoriesChapterFeature({
    @required this.widgetSliderRepository,
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    SubjectRepository subjectRepository =
        Provider.of<SubjectRepository>(context);

    return Loading(
      isLoading: subjectRepository.status.isLoading,
      component: Container(
        child: Column(
          children: [
            HeaderBackButtonCenter(
              headerTitle: subjectRepository.categoryName,
              backTitle: 'Back',
              onBack: () {
                this.widgetSliderRepository.prevWidget();
              },
            ),
            ChapterListFeature(
              items: subjectRepository.categoryCourseItems,
              onClick: (String id) async {
                await subjectRepository.getCourseDetail(id);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SubjectDetailPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
