import 'package:flutter/cupertino.dart';

class IContinueLearningItem {
  final String id;
  final String image;
  final String title;
  final int progress;
  final int totalChoice;

  IContinueLearningItem({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.progress,
    @required this.totalChoice,
  });
}

class IRecommendItem {
  final String id;
  final String image;
  final String title;

  IRecommendItem({
    @required this.id,
    @required this.image,
    @required this.title,
  });
}

class ICategoryItem {
  final String id;
  final String title;
  final String image;

  ICategoryItem({
    @required this.id,
    @required this.title,
    this.image,
  });
}