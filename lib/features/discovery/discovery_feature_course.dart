import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/course_item.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/category_repository.dart';
import 'package:o_learning/repository/discovery_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/states/course_data_types.dart';
import 'package:provider/provider.dart';

class DiscoveryCourse extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  final List<ICourseItem> items;

  DiscoveryCourse(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository,
      @required this.items});

  @override
  _DiscoveryCourse createState() => _DiscoveryCourse(
      widgetSliderRepository: this.widgetSliderRepository,
      discoveryWidgetRepository: this.discoveryWidgetRepository,
      items: this.items);
}

class _DiscoveryCourse extends State<DiscoveryCourse> {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  final List<ICourseItem> items;

  StreamController<String> selectedCourse;
  ScrollController scrollController;
  String selectedCourseId;

  _DiscoveryCourse(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository,
      @required this.items});

  @override
  void initState() {
    this.selectedCourse = StreamController<String>();
    this.selectedCourse.add(this.items[0].id);
    this.selectedCourseId = this.items[0].id;
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
                fontSize: fontSizeP,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 12, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('discovery_course', 'title'),
              style: TextStyle(
                  color: dark,
                  fontSize: fontSizeH3,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('discovery_course', 'description'),
              style: TextStyle(
                  color: gray,
                  fontSize: fontSizeP,
                  fontWeight: FontWeight.bold),
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
                      padding: EdgeInsets.only(left: 16, right: 16),
                      controller: this.scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            this.scrollController.animateTo(
                                (MediaQuery.of(context).size.width * 0.75) *
                                    index,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.ease);
                            this.selectedCourse.add(this.items[index].id);
                          },
                          child: CourseItem(
                            appLocaleRepository: appLocaleRepo,
                            margin: EdgeInsets.only(left: 8, right: 16),
                            image: this.items[index].image,
                            title: this.items[index].title,
                            description: this.items[index].description,
                            isActive: this.items[index].id == snapshot.data,
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
            margin: EdgeInsets.only(left: 16, right: 16),
            title: appLocaleRepo.$l('discovery_course', 'continue_button'),
            onPressed: () {
              this.discoveryWidgetRepository.addCourse(this.selectedCourseId);
              this.widgetSliderRepository.nextWidget();
            },
          )
        ],
      ),
    );
  }
}
