import 'dart:convert';

import 'package:o_learning/cores/config.dart';
import 'package:o_learning/repository/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:o_learning/states/course_data_types.dart';
import 'package:o_learning/utils/object_helper.dart';

class SubjectRepository extends BaseRepository {
  String categoryName = '';

  SubjectRepository() {
    this.object.data['category_item'] = List<Map<String, dynamic>>();
    notifyListeners();
  }

  ICourseItem get courseItem {
    return ICourseItem.fromJson(
        ObjectHelper.toMap(this.object.data['course_item']));
  }

  List<ICourseItem> get categoryCourseItems {
    List<ICourseItem> data = List<ICourseItem>();
    (this.object.data['category_item'] as List<dynamic>).forEach((raw) {
      data.add(ICourseItem.fromJson(ObjectHelper.toMap(raw)));
    });

    return data;
  }

  Future getCategoryDetail(String categoryId) async {
    this.toLoadingStatus();
    try {
      http.Response data = await http.get(
          '${Config.baseURL}/courses?category_id=$categoryId',
          headers: {...ObjectHelper.getHeaderOption(this)});
      this.object.data['category_item'] =
          jsonDecode(data.body == '' ? null : data.body);
    } catch (e) {
      print('get category detail error $e');
      this.toErrorStatus();
    }

    this.toCompleteStatus();
    return true;
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

  setCategoryName(String name) {
    this.categoryName = name;
    this.notifyListeners();
  }
}
