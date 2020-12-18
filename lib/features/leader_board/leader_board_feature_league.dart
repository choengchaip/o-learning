import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class LeaderBoardLeagueFeature extends StatefulWidget {
  final WidgetSliderRepository widgetSliderRepository;

  LeaderBoardLeagueFeature({
    @required this.widgetSliderRepository,
  });

  @override
  _LeaderBoardLeagueFeature createState() => _LeaderBoardLeagueFeature(
        widgetSliderRepository: this.widgetSliderRepository,
      );
}

class _LeaderBoardLeagueFeature extends State<LeaderBoardLeagueFeature> {
  final WidgetSliderRepository widgetSliderRepository;

  _LeaderBoardLeagueFeature({
    @required this.widgetSliderRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColorDark,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  margin: EdgeInsets.only(
                    bottom: 8,
                  ),
                  height: 75,
                  child: Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.lock,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Wooden League',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeP,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
