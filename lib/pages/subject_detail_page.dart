import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/page_slider.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/features/subject/subject_feature.dart';
import 'package:o_learning/repository/page_slider_repository.dart';

class SubjectDetailPage extends StatefulWidget {
  @override
  _SubjectDetailPage createState() => _SubjectDetailPage();
}

class _SubjectDetailPage extends State<SubjectDetailPage> {
  PageSliderRepository pageSliderRepository = new PageSliderRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: PageSlider(
                  pageSliderRepository: this.pageSliderRepository,
                  components: [
                    IPageSlider(
                      component: SubjectFeature(
                        pageSliderRepository: this.pageSliderRepository,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
