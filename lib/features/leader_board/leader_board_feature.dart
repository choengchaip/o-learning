// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/types.dart';
import 'package:o_learning/components/widget_slider.dart';
import 'package:o_learning/features/leader_board/leader_board_feature_friend.dart';
import 'package:o_learning/features/leader_board/leader_board_feature_league.dart';
import 'package:o_learning/features/leader_board/leader_board_feature_navbar.dart';
import 'package:o_learning/repository/page_slider_repository.dart';
import 'package:o_learning/repository/widget_slider_repository.dart';

class LeaderBoardFeature extends StatefulWidget {
  final PageSliderRepository pageSliderRepository;

  LeaderBoardFeature({@required this.pageSliderRepository});

  @override
  _LeaderBoardFeature createState() =>
      _LeaderBoardFeature(pageSliderRepository: this.pageSliderRepository);
}

class _LeaderBoardFeature extends State<LeaderBoardFeature> {
  final PageSliderRepository pageSliderRepository;
  WidgetSliderRepository widgetSliderRepository = new WidgetSliderRepository();

  _LeaderBoardFeature({@required this.pageSliderRepository});

  @override
  void initState() {
    this
        .widgetSliderRepository
        .initial(pageSliderRepo: this.pageSliderRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                LeaderBoardNavBarFeature(
                  widgetSliderRepository: this.widgetSliderRepository,
                ),
                Expanded(
                  child: Container(
                    child: WidgetSlider(
                      widgetSliderRepository: this.widgetSliderRepository,
                      scrollable: false,
                      showDot: false,
                      components: [
                        IWidgetSlider(
                          component: LeaderBoardLeagueFeature(
                            widgetSliderRepository: this.widgetSliderRepository,
                          ),
                        ),
                        IWidgetSlider(
                          component: LeaderBoardFriendFeature(
                            widgetSliderRepository: this.widgetSliderRepository,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
