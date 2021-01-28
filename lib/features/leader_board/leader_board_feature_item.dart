import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_learning/assets/variables.dart';
import 'package:o_learning/components/cache_image.dart';

class LeaderBoardItemFeature extends StatelessWidget {
  final String title;
  final String score;
  final String imageUrl;
  final Color background;
  final Widget icon;

  LeaderBoardItemFeature({
    @required this.title,
    @required this.score,
    @required this.imageUrl,
    @required this.background,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.background,
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 8),
      child: Row(
        children: [
          this.icon,
          CacheImage(
            image: this.imageUrl,
            width: 45,
            height: 45,
            margin: EdgeInsets.only(
              right: 24,
            ),
            shape: BoxShape.circle,
          ),
          Expanded(
            child: Container(
              child: Text(
                this.title,
                style: TextStyle(
                  fontSize: fontSizeP,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 4),
                  margin: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.leaderboard,
                    color: Colors.greenAccent,
                    size: 24,
                  ),
                ),
                Container(
                  child: Text(
                    this.score,
                    style: TextStyle(
                      fontSize: fontSizeP,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
