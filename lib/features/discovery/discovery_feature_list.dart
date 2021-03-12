// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/discovery_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/states/discovery_data_types.dart';
import 'package:provider/provider.dart';

class DiscoveryListFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  final List<IDiscoveryItem> mockItems;

  DiscoveryListFeature(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository,
      @required this.mockItems});

  @override
  _DiscoveryListFeature createState() => _DiscoveryListFeature(
      widgetSliderRepository: this.widgetSliderRepository,
      discoveryWidgetRepository: this.discoveryWidgetRepository,
      mockItems: this.mockItems);
}

class _DiscoveryListFeature extends State<DiscoveryListFeature> {
  final WidgetSliderRepository widgetSliderRepository;
  final DiscoveryWidgetRepository discoveryWidgetRepository;
  final List<IDiscoveryItem> mockItems;

  _DiscoveryListFeature(
      {@required this.widgetSliderRepository,
      @required this.discoveryWidgetRepository,
      @required this.mockItems});

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(context);

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
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
                fontSize: fontSizeP,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 32, left: 8, right: 8),
            child: Text(
              appLocaleRepo.$l('discovery_list', 'title'),
              style: TextStyle(
                  color: dark, fontSize: fontSizeH3, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 16, bottom: 16),
              child: ListView.builder(
                itemCount: this.mockItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      this
                          .discoveryWidgetRepository
                          .addAliasToList(this.mockItems[index].alias);
                      this.widgetSliderRepository.nextWidget();
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(right: 8),
                            height: 85,
                            width: 85,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle)),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 16),
                              child: Text(
                                this.mockItems[index].title,
                                style: TextStyle(
                                    fontSize: fontSizeP,
                                    color: dark,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
