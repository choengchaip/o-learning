import 'package:o_learning/repository/base_repository.dart';

class ObjectHelper {
  ObjectHelper._();

  static getHeaderOption(BaseRepository repo) {
    return {
      'Content-Type': 'application/json',
      'authorization': repo.object.data['access_token']?.replaceAll('"', '')
    };
  }

  static toMap(dynamic raw) {
    Map<String, dynamic> map = Map<String, dynamic>();

    (raw as Map).forEach((key, value) {
      map[key] = value;
    });

    return map;
  }
}
