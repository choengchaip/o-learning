import 'package:flutter/cupertino.dart';

class IAccountItem {
  final String title;
  final String email;
  final String imageUrl;
  final int stars;
  final int scores;

  IAccountItem({
    @required this.title,
    @required this.email,
    @required this.imageUrl,
    @required this.stars,
    @required this.scores,
  });
}
