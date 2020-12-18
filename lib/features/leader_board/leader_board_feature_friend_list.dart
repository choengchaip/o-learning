import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/features/leader_board/leader_board_feature_item.dart';
import 'package:o_learning/states/leader_board_data_types.dart';

class LeaderBoardFriendListFeature extends StatelessWidget {
  final List<ILeaderBoardUserItem> mockItems;

  LeaderBoardFriendListFeature({
    @required this.mockItems,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          itemCount: this.mockItems.length,
          itemBuilder: (BuildContext context, int index) {
            return LeaderBoardItemFeature(
              title: this.mockItems[index].title,
              score: this.mockItems[index].score,
              imageUrl: this.mockItems[index].imageUrl,
              background: Theme.of(context)
                  .primaryColorLight
                  .withOpacity(index % 2 == 0 ? 0.25 : 0.15),
              icon: Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: fontSizeP,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
