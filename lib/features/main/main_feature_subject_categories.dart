import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/field_text.dart';
import 'package:o_learning/features/main/main_feature_subject_categories_continue_learning.dart';
import 'package:o_learning/features/main/main_feature_subject_categories_list.dart';
import 'package:o_learning/features/main/main_feature_subject_categories_recommend.dart';
import 'package:o_learning/mocks/subject_data_types.dart';
import 'package:o_learning/pages/subject_detail_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/subject_widget_repository.dart';
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

  StreamController<bool> searchExpand;
  TextEditingController searchController;
  FocusNode searchNode;

  _MainSubjectCategoriesFeature({
    @required this.widgetSliderRepository,
  });

  @override
  void initState() {
    this.searchExpand = StreamController<bool>();
    this.searchController = TextEditingController(text: '');
    this.searchNode = FocusNode();
    this.searchExpand.add(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);
    SubjectRepository subjectRepository =
        Provider.of<SubjectRepository>(context);

    return StreamBuilder<bool>(
      stream: searchExpand.stream,
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return Stack(
          children: [
            Opacity(
              opacity: snapshot.data ? 0.5 : 1,
              child: IgnorePointer(
                ignoring: snapshot.data,
                child: AnimatedContainer(
                  margin: EdgeInsets.only(
                    top: snapshot.data
                        ? 80 + (MediaQuery.of(context).padding.top)
                        : MediaQuery.of(context).padding.top,
                  ),
                  duration: Duration(milliseconds: 250),
                  color: grayLighter,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      MainSubjectCategoriesContinueLearningFeature(
                        title: 'Continue Learning',
                        items: mockContinueLearning,
                        onClick: (String id) {
                          subjectRepository.setCourseId(id);
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => SubjectDetailPage()));
                        },
                      ),
                      MainSubjectCategoriesRecommendFeature(
                        title: 'Recommend Courses',
                        items: mockRecommend,
                        onClick: (String id) {
                          subjectRepository.setCourseId(id);
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => SubjectDetailPage()));
                        },
                      ),
                      MainSubjectCategoriesListFeature(
                        title: 'Browse Categories',
                        items: mockCategories,
                        onClick: (String id) {
                          subjectRepository.setCourseId(id);
                          subjectRepository.setCourseDetail(
                                mockCategories
                                    .singleWhere((element) => element.id == id),
                              );
                          this.widgetSliderRepository.nextWidget();
                        },
                        onSearch: () {
                          this.searchExpand.add(!snapshot.data);
                          this.searchNode.requestFocus();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              top: snapshot.data
                  ? 0
                  : -130 - (-MediaQuery.of(context).padding.top),
              width: MediaQuery.of(context).size.width,
              duration: Duration(milliseconds: 250),
              child: Container(
                color: Theme.of(context).primaryColorLight,
                padding: EdgeInsets.only(
                    top:
                        snapshot.data ? MediaQuery.of(context).padding.top : 0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                        left: 16,
                        right: 16,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              child: Container(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 4,
                                        right: 4,
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: FieldText(
                                          padding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 0,
                                            right: 16,
                                          ),
                                          fontStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: fontSizeP,
                                          ),
                                          autofocus: false,
                                          controller: this.searchController,
                                          focusNode: this.searchNode,
                                          borderColor: Colors.transparent,
                                          backgroundColor: Theme.of(context)
                                              .primaryColorLight,
                                          placeholder: appLocaleRepo.$l(
                                              'authentication_register',
                                              'name_placeholder'),
                                          onChanged: (String value) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              this.searchExpand.add(false);
                              this.searchNode.unfocus();
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 8,
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: fontSizeP,
                                  color: Colors.white,
                                ),
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
          ],
        );
      },
    );
  }
}
