import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/category/categories_list_feature.dart';
import 'package:o_learning/features/chapter/chapter_feature.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class CategoriesFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  CategoriesFeature({@required this.pageSliderRepository});

  @override
  _SubjectFeature createState() =>
      _SubjectFeature(pageSliderRepository: this.pageSliderRepository);
}

class _SubjectFeature extends State<CategoriesFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = WidgetSliderRepository();

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
      color: grayLighter,
      width: MediaQuery.of(context).size.width,
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
                  component: CategoriesListFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                ),
                IWidgetSlider(
                  component: ChapterFeature(
                    widgetSliderRepository: this.widgetSliderRepository,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
