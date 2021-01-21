import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/features/leader_board/leader_board_feature_item.dart';
import 'package:o_learning/repository/leader_board_repository.dart';
import 'package:o_learning/states/leader_board_data_types.dart';

class LeaderBoardLeagueListFeature extends StatelessWidget {
  final List<ILeaderBoardUserItem> mockItems;
  final LeaderBoardRepository leaderBoardRepository;

  LeaderBoardLeagueListFeature({
    @required this.mockItems,
    @required this.leaderBoardRepository,
  });

  Widget getUserIcon(BuildContext context, String score) {
    switch (score) {
      case '1':
        return Container(
          margin: EdgeInsets.only(right: 16),
          padding: EdgeInsets.all(4.5),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        );
      case '2':
        return Container(
          margin: EdgeInsets.only(right: 16),
          padding: EdgeInsets.all(4.5),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.star,
            color: gray,
          ),
        );
      case '3':
        return Container(
          margin: EdgeInsets.only(right: 16),
          padding: EdgeInsets.all(4.5),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.star,
            color: Theme.of(context).primaryColorDark,
          ),
        );
      default:
        return Container(
          margin: EdgeInsets.only(right: 16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Text(
            score,
            style: TextStyle(
              fontSize: fontSizeP,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          itemCount: this.leaderBoardRepository.items.length,
          itemBuilder: (BuildContext context, int index) {
            return LeaderBoardItemFeature(
              title: this.leaderBoardRepository.items[index]['user_name'] == ''
                  ? 'Invalid name'
                  : this.leaderBoardRepository.items[index]['user_name'],
              score: this
                  .leaderBoardRepository
                  .items[index]['module_progress_current']
                  .toString(),
              imageUrl: this.mockItems[index].imageUrl,
              background: Theme.of(context)
                  .primaryColorLight
                  .withOpacity(index % 2 == 0 ? 0.25 : 0.15),
              icon: this.getUserIcon(context, (index + 1).toString()),
            );
          },
        ),
      ),
    );
  }
}
