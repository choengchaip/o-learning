// @dart=2.9

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/components/radio_button.dart';
import 'package:o_learning/mocks/discovery_goal_data.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/discovery_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/states/discovery_data_types.dart';
import 'package:provider/provider.dart';

class DiscoveryGoal extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;

  DiscoveryGoal(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository});

  @override
  _DiscoveryGoal createState() => _DiscoveryGoal(
      widgetSliderRepository: this.widgetSliderRepository,
      discoveryWidgetRepository: this.discoveryWidgetRepository);
}

class _DiscoveryGoal extends State<DiscoveryGoal> {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  StreamController<int> timeSpend;
  int _timeSpend;

  _DiscoveryGoal(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository});

  @override
  void initState() {
    this.timeSpend = StreamController<int>();
    this.timeSpend.add(5);
    this._timeSpend = 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    List<IDiscoveryGoalItem> goalItems() {
      return discoveryGoalItems.map((IDiscoveryGoalItem obj) {
        String name = '';

        if (obj.minute == 5) {
          name = appLocaleRepo.$l('discovery_goal', 'casual');
        } else if (obj.minute == 10) {
          name = appLocaleRepo.$l('discovery_goal', 'regular');
        } else if (obj.minute == 20) {
          name = appLocaleRepo.$l('discovery_goal', 'serious');
        }

        return IDiscoveryGoalItem(
            name: name,
            minute: obj.minute,
            spendTitle:
                '${obj.minute} ${appLocaleRepo.$l('discovery_goal', 'minute')}');
      }).toList();
    }

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              appLocaleRepo.$l('discovery_goal', 'header'),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: fontSizeP,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ListView(
                children: [
                  Container(
                    child: Text(
                      appLocaleRepo.$l('discovery_goal', 'title'),
                      style: TextStyle(
                          fontSize: fontSizeH3, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image.asset('lib/statics/discovery_goal.png'),
                  ),
                  Container(
                    child: Text(
                      appLocaleRepo.$l('discovery_goal', 'note'),
                      style: TextStyle(fontSize: fontSizeP, color: gray),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Card(
                      child: StreamBuilder(
                        stream: timeSpend.stream,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          }

                          return Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  List.generate(goalItems().length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    this
                                        .timeSpend
                                        .add(goalItems()[index].minute);
                                    this._timeSpend = goalItems()[index].minute;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            top: BorderSide(
                                                color: index == 0
                                                    ? Colors.white
                                                    : Colors.black12,
                                                width: 1))),
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 16),
                                    child: Row(
                                      children: [
                                        RadioButton(
                                          margin: EdgeInsets.only(right: 16),
                                          active: snapshot.data ==
                                              goalItems()[index].minute,
                                        ),
                                        Container(
                                          child: Text(
                                            goalItems()[index].name,
                                            style: TextStyle(
                                                fontSize: fontSizeH5,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Text(
                                            goalItems()[index].spendTitle,
                                            style:
                                                TextStyle(fontSize: fontSizeH5),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CurveButton(
            title: appLocaleRepo.$l('discovery_goal', 'continue_button'),
            onPressed: () {
              this.discoveryWidgetRepository.addGoal(this._timeSpend);
              this.widgetSliderRepository.nextWidget();
            },
          )
        ],
      ),
    );
  }
}
