import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';
import 'package:provider/provider.dart';

class LeaderBoardNavBarFeature extends StatelessWidget {
  final WidgetSliderRepository widgetSliderRepository;
  StreamController<int> navBar = StreamController<int>();

  LeaderBoardNavBarFeature({
    @required this.widgetSliderRepository,
  });

  @override
  Widget build(BuildContext context) {
    AppLocaleRepository appLocaleRepo =
    Provider.of<AppLocaleRepository>(context);

    return StreamBuilder<int>(
      stream: navBar.stream,
      builder: (BuildContext context, snapshot) {
        if(!snapshot.hasData){
          this.navBar.add(0);
          return Container();
        }

        return Container(
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          this.navBar.add(0);
                          this.widgetSliderRepository.toWidget(0);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Theme.of(context).primaryColorLight,
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                          ),
                          child: Text(
                            appLocaleRepo.$l('leader_board', 'leagues'),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          this.navBar.add(1);
                          this.widgetSliderRepository.toWidget(1);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                          ),
                          color: Theme.of(context).primaryColorLight,
                          child: Text(
                            appLocaleRepo.$l('leader_board', 'friends'),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 150),
                alignment: snapshot.data == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  height: 3,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
