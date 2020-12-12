import 'package:flutter/cupertino.dart';

class ICourseItem {
  final String title;
  final List<IChapterItem> chapters;

  ICourseItem({
    @required this.title,
    @required this.chapters,
  });
}

class IChapterItem {
  final String id;
  final String image;
  final IconData icon;
  final String title;
  final String description;
  final bool canLearn;
  final bool isPassed;
  final int progress;

  IChapterItem({
    this.id,
    this.image,
    this.icon,
    @required this.title,
    this.description,
    this.canLearn,
    this.isPassed,
    this.progress,
  });
}
