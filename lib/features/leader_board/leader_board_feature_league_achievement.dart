import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';

class LeaderBoardLeagueAchievementFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
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
    );
  }
}
