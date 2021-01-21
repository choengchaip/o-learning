class IDiscoveryItem {
  final String image;
  final String title;
  final String alias;

  IDiscoveryItem({
    this.image,
    this.title,
    this.alias,
  });
}

class IDiscoveryCourseItem {
  final String course_id;
  final String course_image;
  final String course_name;
  final String course_description;
  final int progress;
  final String category_id;

  IDiscoveryCourseItem({
    this.course_id,
    this.course_image,
    this.course_name,
    this.course_description,
    this.progress,
    this.category_id,
  });
}

class IDiscoveryGoalItem {
  final int minute;
  final String name;
  final String spendTitle;

  IDiscoveryGoalItem({
    this.minute,
    this.name,
    this.spendTitle,
  });
}
