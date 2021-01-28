import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/field_text.dart';
import 'package:o_learning/components/loading_item.dart';
import 'package:o_learning/features/category/categories_list_feature_continue_learning.dart';
import 'package:o_learning/features/category/categories_list_feature_recommend.dart';
import 'package:o_learning/features/category/categories_list_feature_search.dart';
import 'package:o_learning/mocks/subject_data_types.dart';
import 'package:o_learning/pages/subject_detail_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/category_repository.dart';
import 'package:o_learning/repository/subject_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class CategoriesListFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  CategoriesListFeature({
    @required this.widgetSliderRepository,
  });

  @override
  _CategoriesListFeature createState() =>
      _CategoriesListFeature(
        widgetSliderRepository: this.widgetSliderRepository,
      );
}

class _CategoriesListFeature extends State<CategoriesListFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  StreamController<bool> searchExpand;
  TextEditingController searchController;
  FocusNode searchNode;
  CategoryRepository categoryRepository = new CategoryRepository();

  _CategoriesListFeature({
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
                        ? 80 + (MediaQuery
                        .of(context)
                        .padding
                        .top)
                        : MediaQuery
                        .of(context)
                        .padding
                        .top,
                  ),
                  duration: Duration(milliseconds: 250),
                  color: grayLighter,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
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
                                    Theme
                                        .of(context)
                                        .primaryColor),
                              ),
                            );
                          }

                          return CategoriesListContinueLearningFeature(
                            title: 'Continue Learning',
                            items: this.categoryRepository.myCourseItems,
                            onClick: (String id) async {
                              await subjectRepository.getCourseDetail(id);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SubjectDetailPage()));
                            },
                          );
                        },
                      ),
                      FutureBuilder(
                        future: this.categoryRepository.fetchCacheAllCourse(),
                        builder: (BuildContext context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container(
                              height: 200,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme
                                        .of(context)
                                        .primaryColor),
                              ),
                            );
                          }

                          return CategoriesListRecommendFeature(
                            title: 'Recommend Courses',
                            items: this.categoryRepository.courseItems,
                            onClick: (String id) async {
                              await subjectRepository.getCourseDetail(id);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SubjectDetailPage()));
                            },
                          );
                        },
                      ),
                      FutureBuilder(
                        future: categoryRepository.fetchCacheCategories(),
                        builder: (BuildContext context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container(
                              height: 200,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme
                                        .of(context)
                                        .primaryColor),
                              ),
                            );
                          }

                          return CategoriesListSearchFeature(
                            title: 'Browse Categories',
                            items: this.categoryRepository.items,
                            onClick: (String id) async {
                              await categoryRepository.getCategoryDetail(id);
                              this.widgetSliderRepository.nextWidget();
                            },
                            onSearch: () {
                              this.searchExpand.add(!snapshot.data);
                              this.searchNode.requestFocus();
                            },
                          );
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
                  : -130 - (-MediaQuery
                  .of(context)
                  .padding
                  .top),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              duration: Duration(milliseconds: 250),
              child: Container(
                color: Theme
                    .of(context)
                    .primaryColorLight,
                padding: EdgeInsets.only(
                    top:
                    snapshot.data ? MediaQuery
                        .of(context)
                        .padding
                        .top : 0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                        left: 16,
                        right: 16,
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              child: Container(
                                color: Theme
                                    .of(context)
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
                                          backgroundColor: Theme
                                              .of(context)
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
            LoadingItem(
              isLoading: categoryRepository.status.isLoading,
            ),
          ],
        );
      },
    );
  }
}
