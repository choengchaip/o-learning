// @dart=2.9

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/loading_item.dart';
import 'package:o_learning/features/course/course_section_feature.dart';
import 'package:o_learning/features/course/course_select_feature.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/category_repository.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/quiz_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class CourseFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  CourseFeature({
    @required this.pageSliderRepository,
  });

  @override
  _CourseFeature createState() => _CourseFeature(
        pageSliderRepository: this.pageSliderRepository,
      );
}

class _CourseFeature extends State<CourseFeature> {
  final PageSliderRepository pageSliderRepository;

  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();
  CategoryRepository categoryRepository = new CategoryRepository();
  ScrollController mainScrollController = ScrollController();
  StreamController<double> transparentBackground;
  StreamController<bool> courseExpand;
  bool _courseExpand;
  double _oldTransparentBackground;

  _CourseFeature({
    @required this.pageSliderRepository,
  });

  @override
  void initState() {
    this
        .widgetSliderRepository
        .initial(pageSliderRepo: this.pageSliderRepository);
    this.transparentBackground = StreamController<double>();
    this.courseExpand = StreamController<bool>.broadcast();
    this.transparentBackground.add(0);
    this._oldTransparentBackground = 0;
    this._courseExpand = false;
    this.courseExpand.add(this._courseExpand);
    super.initState();
  }

  @override
  void dispose() {
    this.transparentBackground.close();
    this.courseExpand.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthRepository authRepo = Provider.of<AuthRepository>(context);
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    QuizRepository quizRepository = Provider.of<QuizRepository>(context);

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  StreamBuilder(
                    stream: this.courseExpand.stream,
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        this.courseExpand.add(false);
                        return Container();
                      }

                      return AnimatedOpacity(
                        opacity:
                            (snapshot.data || quizRepository.status.isLoading)
                                ? 0.5
                                : 1,
                        duration: Duration(milliseconds: 250),
                        child: IgnorePointer(
                          ignoring:
                              snapshot.data || quizRepository.status.isLoading,
                          child: Container(
                            color: Colors.white,
                            child:
                                NotificationListener<ScrollUpdateNotification>(
                              onNotification: (notification) {
                                double transparent =
                                    notification.metrics.pixels / 200;
                                if (transparent > 1) {
                                  transparent = 1;
                                }
                                if (transparent <= 0) {
                                  transparent = 0;
                                }
                                if (transparent <= 1) {
                                  this._oldTransparentBackground = transparent;
                                  this.transparentBackground.add(transparent);
                                }

                                return true;
                              },
                              child: FutureBuilder(
                                future: this
                                    .categoryRepository
                                    .fetchCacheMyCourseDetail(
                                        authRepo.currentCourseId),
                                builder: (BuildContext context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Theme.of(context).primaryColor),
                                      ),
                                    );
                                  }

                                  if (this.categoryRepository.myCourseItem ==
                                      null) {
                                    print("asd");
                                    return Container(
                                      alignment: Alignment.center,
                                      child: Text(appLocaleRepo.$l(
                                          'chapter', 'no_course_regis')),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: this
                                            .categoryRepository
                                            .myCourseItem
                                            ?.modules
                                            ?.length ??
                                        0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          this.transparentBackground.add(this._oldTransparentBackground);
                                      if (index == 0) {
                                        return CourseSectionFeature(
                                          topWidget: Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            height: 350,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image.asset(
                                              'lib/statics/course_background.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          module: this
                                              .categoryRepository
                                              .myCourseItem
                                              .modules[0],
                                          onClick: (String id) async {
                                            await quizRepository
                                                .getQuizDetail(id, []);
                                            quizRepository.expandQuizFeature();
                                          },
                                        );
                                      }

                                      return CourseSectionFeature(
                                        module: this
                                            .categoryRepository
                                            .myCourseItem
                                            .modules[index],
                                        onClick: (String id) async {
                                          await quizRepository
                                              .getQuizDetail(id, []);
                                          quizRepository.expandQuizFeature();
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  FutureBuilder(
                    future: this.categoryRepository.fetchCacheMyCourse(),
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          height: 200,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        );
                      }

                      return StreamBuilder(
                        stream: this.courseExpand.stream,
                        builder: (BuildContext context, snapshot) {
                          if (!snapshot.hasData) {
                            this.courseExpand.add(false);
                            return Container();
                          }

                          return CourseSelectFeature(
                            isExpand: snapshot.data,
                            appLocaleRepository: appLocaleRepo,
                            items: this.categoryRepository.myCourseItems,
                            onChanged: (String id, String name) {
                              this._courseExpand = !this._courseExpand;
                              this.courseExpand.add(this._courseExpand);
                              authRepo.setCourseId(id);
                              authRepo.setCourseName(name);
                            },
                          );
                        },
                      );
                    },
                  ),
                  StreamBuilder<double>(
                    stream: transparentBackground.stream,
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }

                      return AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        color: Theme.of(context).primaryColor.withOpacity(
                            this._courseExpand ? 1 : snapshot.data),
                        height: 50 + MediaQuery.of(context).padding.top + 16,
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: MediaQuery.of(context).padding.top + 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            this.categoryRepository.myCourseItem == null
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      this._courseExpand = !this._courseExpand;
                                      this.courseExpand.add(this._courseExpand);
                                      if (this._courseExpand) {
                                        this.transparentBackground.add(1);
                                      } else {
                                        this.transparentBackground.add(
                                            this._oldTransparentBackground);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(32),
                                        ),
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 6,
                                          bottom: 6,
                                          left: 12,
                                          right: 4),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              authRepo.currentCourseName ??
                                                  'Invalid',
                                              style: TextStyle(
                                                fontSize: fontSizeP,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Stack(
                                              children: [
                                                AnimatedOpacity(
                                                  opacity: this._courseExpand
                                                      ? 1
                                                      : 0,
                                                  duration: Duration(
                                                      milliseconds: 250),
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                AnimatedOpacity(
                                                  opacity: this._courseExpand
                                                      ? 0
                                                      : 1,
                                                  duration: Duration(
                                                      milliseconds: 250),
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
                                            authRepo.star.toString(),
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
                                            authRepo.progress.toString(),
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
                  LoadingItem(
                    isLoading: quizRepository.status.isLoading,
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
