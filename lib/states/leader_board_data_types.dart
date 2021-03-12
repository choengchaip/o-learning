// @dart=2.9

class ILeaderBoardUserItem {
  String id;
  final String title;
  final String imageUrl;
  final String score;

  ILeaderBoardUserItem({
    this.id,
    this.title,
    this.imageUrl,
    this.score,
  });

  factory ILeaderBoardUserItem.fromJson(Map<String, dynamic> rawJson) {
    return ILeaderBoardUserItem(
        id: rawJson['user_id'],
        title: rawJson['user_name'] ?? 'No name',
        imageUrl: rawJson['image'] ?? '',
        score: rawJson['module_progress_current'].toString());
  }
}
