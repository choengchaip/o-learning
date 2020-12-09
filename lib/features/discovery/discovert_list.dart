import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/repository/discovery_widget_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:o_learning/states/discovery_data_types.dart';

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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              'MOTIVE',
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
              'Why are you learning\nto code?',
              style: TextStyle(
                  color: dark, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: this.mockItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      this.discoveryWidgetRepository.addAliasToList(this.mockItems[index].alias);
                      this.widgetSliderRepository.nextPage();
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(right: 8),
                            height: 60,
                            width: 60,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle)),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                this.mockItems[index].title,
                                style: TextStyle(
                                    color: dark, fontWeight: FontWeight.bold),
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
