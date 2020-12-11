import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/features/main/main_feature_course_section.dart';
import 'package:o_learning/mocks/course_data.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class MainCourseFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  MainCourseFeature({@required this.pageSliderRepository});

  @override
  _MainCourseFeature createState() =>
      _MainCourseFeature(pageSliderRepository: this.pageSliderRepository);
}

class _MainCourseFeature extends State<MainCourseFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();
  ScrollController mainScrollController = ScrollController();
  StreamController<double> transparentBackground = StreamController<double>();

  _MainCourseFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this
        .widgetSliderRepository
        .initial(pageSliderRepo: this.pageSliderRepository);
    this.transparentBackground.add(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: NotificationListener<ScrollUpdateNotification>(
                      onNotification: (notification) {
                        double transparent = notification.metrics.pixels / 200;
                        if (transparent > 1) {
                          transparent = 1;
                        }
                        if (transparent <= 0) {
                          transparent = 0;
                        }
                        if (transparent <= 1) {
                          this.transparentBackground.add(transparent);
                        }

                        return true;
                      },
                      child: ListView(
                        children: [
                          Container(
                            height: 275,
                            color: Colors.black.withOpacity(0.085),
                            child: Image.asset(
                              'lib/statics/course_background.jpg',
                              filterQuality: FilterQuality.low,
                            ),
                          ),
                          MainCourseSectionFeature(
                            course: mockHtml,
                          ),
                          MainCourseSectionFeature(
                            course: mockHtmlIntermediate,
                          ),
                          MainCourseSectionFeature(
                            course: mockCss,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(),
                  StreamBuilder<double>(
                    stream: transparentBackground.stream,
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }

                      return AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        color: Theme.of(context)
                            .primaryColor
                            .withOpacity(snapshot.data),
                        height: 50 + MediaQuery.of(context).padding.top,
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: MediaQuery.of(context).padding.top),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  top: 6, bottom: 6, left: 12, right: 4),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Web',
                                      style: TextStyle(
                                        fontSize: fontSizeP,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 4, bottom: 4, left: 6, right: 8),
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 2),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 4),
                                          child: Text(
                                            '13',
                                            style: TextStyle(
                                                fontSize: fontSizeP,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 4, bottom: 4, left: 6, right: 8),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 2),
                                          child: Icon(
                                            Icons.leaderboard,
                                            color: Colors.greenAccent,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 4),
                                          child: Text(
                                            '13',
                                            style: TextStyle(
                                                fontSize: fontSizeP,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
