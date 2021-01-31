import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/features/leader_board/leader_board_feature_item.dart';
import 'package:o_learning/repository/leader_board_repository.dart';
import 'package:o_learning/states/leader_board_data_types.dart';

class LeaderBoardLeagueListFeature extends StatelessWidget {
  final LeaderBoardRepository leaderBoardRepository;

  LeaderBoardLeagueListFeature({
    @required this.leaderBoardRepository,
  });

  Widget getUserIcon(BuildContext context, String score) {
    switch (score) {
      case '1':
        return Container(
          width: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 6),
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
          width: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 6),
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
          width: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 6),
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
          width: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 6),
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
              title: this.leaderBoardRepository.items[index].title == ''
                  ? 'Invalid name'
                  : this.leaderBoardRepository.items[index].title,
              score: this
                  .leaderBoardRepository
                  .items[index].score
                  .toString(),
              imageUrl: this.leaderBoardRepository.items[index].imageUrl,
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
