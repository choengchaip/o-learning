import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/components/loading.dart';
import 'package:o_learning/features/leader_board/leader_board_feature_league_achievement.dart';
import 'package:o_learning/features/leader_board/leader_board_feature_league_list.dart';
import 'package:o_learning/mocks/leader_board_data.dart';
import 'package:o_learning/repository/leader_board_repository.dart';
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
  LeaderBoardRepository leaderBoardRepo = new LeaderBoardRepository();

  _LeaderBoardLeagueFeature({
    @required this.widgetSliderRepository,
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.leaderBoardRepo.fetchLeaderBoard();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.leaderBoardRepo.fetchCacheLeaderBoard(),
      builder: (BuildContext context, data) {
        return Loading(
          isLoading: !data.hasData,
          component: Container(
            child: Column(
              children: [
                LeaderBoardLeagueAchievementFeature(),
                LeaderBoardLeagueListFeature(
                  mockItems: mockLeaderBoardUserItems,
                  leaderBoardRepository: this.leaderBoardRepo,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
