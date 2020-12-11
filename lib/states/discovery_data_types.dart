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
  final String id;
  final String image;
  final String title;
  final String description;
  final int progress;

  IDiscoveryCourseItem({
    this.id,
    this.image,
    this.title,
    this.description,
    this.progress,
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
