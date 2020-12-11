import 'package:flutter/cupertino.dart';

class IContinueLearningItem {
  final String image;
  final String title;
  final int progress;
  final int totalChoice;

  IContinueLearningItem({
    @required this.image,
    @required this.title,
    @required this.progress,
    @required this.totalChoice,
  });
}

class IRecommendItem {
  final String image;
  final String title;

  IRecommendItem({
    @required this.image,
    @required this.title,
  });
}

