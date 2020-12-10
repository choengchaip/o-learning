import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/components/curve_button.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/discovery_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/states/discovery_data_types.dart';
import 'package:provider/provider.dart';

class DiscoveryExperienceFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;

  DiscoveryExperienceFeature(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository});

  @override
  _DiscoveryExperienceFeature createState() => _DiscoveryExperienceFeature(
        widgetSliderRepository: this.widgetSliderRepository,
        discoveryWidgetRepository: this.discoveryWidgetRepository,
      );
}

class _DiscoveryExperienceFeature extends State<DiscoveryExperienceFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  StreamController<double> experienceValue;
  double _experienceValue;

  _DiscoveryExperienceFeature({
    @required this.widgetSliderRepository,
    @required this.discoveryWidgetRepository,
  });

  @override
  void initState() {
    this.experienceValue = new StreamController<double>();
    this.experienceValue.add(0);
    this._experienceValue = 0;
    super.initState();
  }

  @override
  void dispose() {
    this.experienceValue.close();
    super.dispose();
  }

  updateExperienceValue(double value) {
    this.experienceValue.add(value);
    this._experienceValue = value;
  }

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              appLocaleRepo.$l('discovery_list', 'header'),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 32, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('discovery_list', 'title'),
              style: TextStyle(
                  color: dark, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          StreamBuilder(
            stream: experienceValue.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              return Column(
                children: [
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 100,
                          left: 175,
                          child: AnimatedOpacity(
                            opacity: snapshot.data == 100 ? 1 : 0,
                            duration: Duration(milliseconds: 250),
                            child: Container(
                              width: 150,
                              child: Image.asset(
                                  'lib/statics/experience_book_a_lot.png'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 90,
                          left: 25,
                          child: AnimatedOpacity(
                            opacity: snapshot.data >= 50 ? 1 : 0,
                            duration: Duration(milliseconds: 250),
                            child: Container(
                              width: 150,
                              child: Image.asset(
                                  'lib/statics/experience_book_little.png'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          left: 100,
                          child: AnimatedOpacity(
                            opacity: 1,
                            duration: Duration(milliseconds: 250),
                            child: Container(
                              width: 200,
                              child: Image.asset(
                                  'lib/statics/experience_book_base.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedOpacity(
                          opacity: (snapshot.data >= 0 && snapshot.data < 49)
                              ? 1
                              : 0.25,
                          duration: Duration(milliseconds: 250),
                          child: Container(
                            child: Text(
                              appLocaleRepo.$l('discovery_list', 'experience_none'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: (snapshot.data >= 50 && snapshot.data < 100)
                              ? 1
                              : 0.25,
                          duration: Duration(milliseconds: 250),
                          child: Container(
                            child: Text(
                              appLocaleRepo.$l('discovery_list', 'experience_little'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: snapshot.data == 100 ? 1 : 0.25,
                          duration: Duration(milliseconds: 250),
                          child: Container(
                            child: Text(
                              appLocaleRepo.$l('discovery_list', 'experience_a_lot'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          width: MediaQuery.of(context).size.width,
                          child: CupertinoSlider(
                            min: 0,
                            max: 100,
                            divisions: 100,
                            activeColor: gray,
                            thumbColor: Theme.of(context).primaryColor,
                            onChangeEnd: (double value) {
                              double newValue = value / 25;
                              if (newValue <= 1) {
                                this.updateExperienceValue(0);
                              } else if (newValue > 2.75) {
                                this.updateExperienceValue(100);
                              } else {
                                this.updateExperienceValue(50);
                              }
                            },
                            onChanged: (double value) {
                              this.updateExperienceValue(value);
                            },
                            value: snapshot.data,
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              AnimatedOpacity(
                                opacity: snapshot.data >= 100 ? 1 : 0,
                                duration: Duration(milliseconds: 250),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                      appLocaleRepo.$l('discovery_list', 'experience_a_lot_description'),
                                    style: TextStyle(fontSize: 16, color: gray),
                                  ),
                                ),
                              ),
                              AnimatedOpacity(
                                opacity:
                                    (snapshot.data >= 50 && snapshot.data < 100)
                                        ? 1
                                        : 0,
                                duration: Duration(milliseconds: 250),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    appLocaleRepo.$l('discovery_list', 'experience_little_description'),
                                    style: TextStyle(fontSize: 16, color: gray),
                                  ),
                                ),
                              ),
                              AnimatedOpacity(
                                opacity:
                                    (snapshot.data >= 0 && snapshot.data < 49)
                                        ? 1
                                        : 0,
                                duration: Duration(milliseconds: 250),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    appLocaleRepo.$l('discovery_list', 'experience_none_description'),
                                    style: TextStyle(fontSize: 16, color: gray),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          CurveButton(
            title: 'CONTINUE',
            onPressed: () {
              this.discoveryWidgetRepository.addAliasToList(_experienceValue.toString());
              this.widgetSliderRepository.nextPage();
            },
          ),
        ],
      ),
    );
  }
}
