import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/discovery_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/states/discovery_data_types.dart';
import 'package:provider/provider.dart';

class DiscoveryCourse extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  final List<IDiscoveryCourseItem> mockItems;

  DiscoveryCourse(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository,
      @required this.mockItems});

  @override
  _DiscoveryCourse createState() => _DiscoveryCourse(
      widgetSliderRepository: this.widgetSliderRepository,
      discoveryWidgetRepository: this.discoveryWidgetRepository,
      mockItems: this.mockItems);
}

class _DiscoveryCourse extends State<DiscoveryCourse> {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  final List<IDiscoveryCourseItem> mockItems;
  StreamController<String> selectedCourse;
  ScrollController scrollController;
  String selectedCourseId;

  _DiscoveryCourse(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository,
      @required this.mockItems});

  @override
  void initState() {
    this.selectedCourse = StreamController<String>();
    this.selectedCourse.add(this.mockItems[0].id);
    this.selectedCourseId = this.mockItems[0].id;
    this.scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, bottom: 12),
            child: Text(
              appLocaleRepo.$l('discovery_course', 'header'),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 12, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('discovery_course', 'title'),
              style: TextStyle(
                  color: dark, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('discovery_course', 'description') + 'as',
              style: TextStyle(
                  color: gray, fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: StreamBuilder(
                stream: this.selectedCourse.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    );
                  }

                  return Container(
                    height:
                        (MediaQuery.of(context).size.width * 0.75) / ratio78,
                    child: ListView.builder(
                      controller: this.scrollController,
                      padding: EdgeInsets.only(right: 16, left: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: mockItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            this.scrollController.animateTo(
                                (MediaQuery.of(context).size.width * 0.75) *
                                    index,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.ease);
                            this.selectedCourse.add(this.mockItems[index].id);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 8, right: 16),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      snapshot.data ==
                                          this.mockItems[index].id ?
                                      BoxShadow(
                                          color: Theme.of(context).primaryColor,
                                          blurRadius: 0,
                                          spreadRadius: 3):
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        flex: 8,
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Image.asset(
                                              this.mockItems[index].image),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 7,
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 8),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  mockItems[index].title,
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    mockItems[index]
                                                        .description,
                                                    style: TextStyle(
                                                        color: gray,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          CurveButton(
              title: appLocaleRepo.$l('discovery_course', 'continue_button'),
              onPressed: () {
                this.discoveryWidgetRepository.addAliasToList(this.selectedCourseId);
              })
        ],
      ),
    );
  }
}
