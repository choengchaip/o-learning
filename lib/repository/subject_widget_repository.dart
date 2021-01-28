import 'dart:convert';

import 'package:o_learning/cores/config.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:o_learning/states/course_data_types.dart';
import 'package:o_learning/utils/object_helper.dart';

class SubjectRepository extends BaseRepository {
  SubjectRepository() {
    notifyListeners();
  }

  ICourseItem get courseItem {
    return ICourseItem.fromJson(ObjectHelper.toMap(this.object.data['course_item']));
  }

  Future getCourseDetail(String courseId) async {
    this.toLoadingStatus();
    try {
      http.Response data = await http.get(
          '${Config.baseURL}/courses/my/$courseId',
          headers: {...ObjectHelper.getHeaderOption(this)});
      this.object.data['course_item'] = jsonDecode(data.body);
    } catch (e) {
      print('get course detail error $e');
      this.toErrorStatus();
    }

    this.toCompleteStatus();
  }
}
